# Assorted list of string operations

## Reverse a string

Most distro's have the tool `rev` installed by default, which reverses strings piped into it.

## Reverse dot-separated string

e.g. `www.google.com` --> `com.google.www`

also works with file input

```bash
cat file.txt | perl -lpe '$_ = join ".", reverse split /\./;'
```


