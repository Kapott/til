# Quickly troubleshoot a full EC2 root partition

Can't do anything because the root instance is at 100% usage?

## Find the biggest directories, and clean 'em up

First off delete things like large unnecessary files. Use the following command to find 'em fast:

```sh
du -a --max-depth=1 / | sort -n
```

Replace the '/' with a directory you wish to dig down in. This command lists dirs by size. Go down one dir every time to find the biggest files you can remove.

## Delete superfluous logs

Go to `/var/log` and delete every gzipped logfile you have - be sure to back them up to your local machine with `rsync --delete` first if you need them.

Dump all logs and resize the disk fast:

```sh
    journalctl --rotate \
      && journalctl --vacuum-time=1s
```