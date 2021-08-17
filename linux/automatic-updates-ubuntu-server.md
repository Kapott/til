# Automatic updates for ubuntu server

## Enable automatic updates:

`sudo nano /etc/apt/apt.conf.d/20auto-upgrades`

Change/add:

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
```

## Enable automatic reboots for security updates

Some updates need to reboot the system, as the kernel and most running drivers can't be patched in-place.
This is critical when applying security patches.

`sudo vim /etc/apt/apt.conf.d/50unattended-upgrades`

Change/add:

```
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

## Check if this all works

`sudo unattended-upgrades --dry-run --debug`

Or wait, and then check the logs:

`cat /var/log/unattended-upgrades/unattended-upgrades.log`




