# Set up fail2ban on ssh on ubuntu, fast

`sudo apt update && sudo apt install fail2ban -y`

Create the jail file:

`sudo vim /etc/fail2ban/jail.local`

Add this to the file:

```
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
```

And restart fail2ban:

`sudo sustemctl restart fail2ban`