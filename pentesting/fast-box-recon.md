# Fast box recon

Nmap is thorough, but slow. Here are some tricks to speed up network and/or host scanning and/or enumeration.

Start with masscan, and grab banners

    masscan -p1-65535 10.0.0.50 --rate 1000 ---open --banners -e tun0

Say we have ports 22 and 80 open, we then run nmap against those ports

    nmap -p22,80 -sC -sV 10.0.0.50

See if there is low hanging fruit with `nikto`

    nikto -host 10.0.0.50

And then run `gobuster` against the host's open webserver port (if any)

    gobuster dir -w /opt/SecLists/Discovery/Web-Content/big.txt -u http://10.0.0.50
