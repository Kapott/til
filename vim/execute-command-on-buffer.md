# Execute a command in the current vim buffer with %!

This is very nifty when doing, for example, file exploration.


Sort al lines, keep unique lines:

```vim
:%! sort -u
```

Find all lines that don't contain a word:

```vim
;%! grep -v 'a word'
```
