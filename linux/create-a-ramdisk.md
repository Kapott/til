# Create a ramdisk for blazingly fast I/O

Very  useful for running things from ram (gameservers, other things which require fast I/O)

```
mkdir -p /mnt/ram
mount -t tmpfs tmpfs /mnt/ram -o size=8192M
```