# Basic forensic commands

## General must-know commands
`date` Check for skewed clock, timezone.
`uname -a` OS information.
`ifconfig -a` or `ip a` List network interfaces.
`ps -ef` Running processes.
`netstat -anp tcp` Open tcp ports.
`lsof -V` Open files.
`netstat -rn; route` Routing tables.
`df; mount` Free space and mounted devices.
`free` Memory and swap spaces.
`w` Who is connected.
`last` Show list of last logins.

## Tracking down packages and binaries
`find /directory -type f -mtime -1 -print` Look through directory for files modified in the last minute.
`grep -E "Package:|Status:" /var/lib/dpkg/status` Look through details about installed packages on debian-based system.
`grep installed /var/log/dpkg.log` Look for installed packages.
`rpm -qa --root=/ mntpath/var/lib/rpm` Look for installed packages on redhat-based systems.
`/usr/local /opt` Check these dirs for manually installed binaries.
`find /sbin/ -exec dpkg -S {} \; | grep "no path found"` Find executables not installed through packages in sbin on debian systems.
`find /sbin/ -exec rpm -qf {} \; | grep "is not"` Find executables not installed through packages in sbin on debian systems.
