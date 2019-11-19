# Assorted list of string operations



## Reverse dot-separated string

e.g. `www.google.com` --> `com.google.www`

also works with file input

```bash
cat file.txt | perl -lpe '$_ = join ".", reverse split /\./;'
```


