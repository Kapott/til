# Mount an SMB share at startup

Make sure you've installed cifs-tools.

- touch ~/.cifs-credentials
- vim ~/.cifs-credentials, contents below
- chmod 0644 ~/.cifs-credentials
- sudo vim /etc/fstab
- add the line, found below, to the /etc/fstab file
- test if the line works: `sudo mount -a`

## Contents of ~/.cifs-credentials file

```
username={{smb-username}}
password={{smb-password}}
```

## Content to add to /etc/fstab

`//{{SMB-SERVER}}/{{mountname-or-path}} /{{local-mount-name}} cifs credentials=/home/{{username}}/.cifs-credentials,vers=3.0,iocharset=utf8,file_mode=0777,dir_mode=0777,uid={{username}},gid={{username}},nofail 0 0`

