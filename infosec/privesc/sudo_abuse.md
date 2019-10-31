# sudo abuse

Or, more appropriately: setuid bit misconfiguration abuse.



Start with listing what you're allowed to `sudo`.

    sudo -l

This might give your things which can pop shells themselves, like nano or vi.

In the most basic case it'll allow you to directly run a shellfile with root rights. If you can insert `/bin/bash -i` in there, you're done. Root shell acquired.



If the program is locked into a dir, like `/var/logs` for example - try using directory traversal to get what you need.



List binaries that have `setuid` bit set:

    find / -user root -perm -4000 -print 2>/dev/null
    find / -perm -u=s -type f 2>/dev/null
    find / -user root -perm -4000 -exec ls -ldb {} \;

Small list of known tools which can grant privesc when setuid isn't set correctly:

- Nmap

- Vim

- find

- Bash

- More

- Less

- Nano

- cp
