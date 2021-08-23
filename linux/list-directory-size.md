# List directory sizes

Something you'd want `ls` to do, really. I have this aliased in my `.bashrc` for ease of use.

`find . -maxdepth 1 -mindepth 1 -type d -exec du -hs {} \;`

If you want to modify this to accept paramters so you can list any dir, just replace `.` with `"$1"`.