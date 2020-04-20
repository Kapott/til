# Move all files in subdirectories recursively

The applications of the `find` command continue to amaze me. Note: `mv -i` asks what to do when files have duplicate names. If you want to keep the existing file by default use `mv -n`.

```sh
find . -mindepth 2 -type f -print -exec mv -i {} . \;
```