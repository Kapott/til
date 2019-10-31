# Pspy

Pspy watches files in commonly used areas  like `/bin` and `/tmp`. It uses the `inotify` api, and whenever a file is touched it scans `/proc` in order to try and catch the process triggering it. Not 100% foolproof, but works. Works better on long-running processes. Ymmv.


