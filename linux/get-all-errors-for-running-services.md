# Get all errors for running services

If you want to quickly glance at all errors for all running services in systemd, use this one:

```
journalctl -p 3 -xb
```

`-p 3` means priority "error"
`-x` means "provide extra information"
`-b` means "since last boot"