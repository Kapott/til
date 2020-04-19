# How to unban an ip address banned by fail2ban

Most common usecase in my case: unban an ip from ssh.

`sudo fail2ban-client set sshd unbanip {IP_ADDR}`