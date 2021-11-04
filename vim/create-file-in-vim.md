# Create a file in vim

When using nerdtree, creating a file is easy. But working without Nerdtree is often a lot faster.
Hence this is the thing we need to remember:

```
: %:p:h/foopath/filename.ext
```

This will create a file in the directory `foopath` named `filename.ext`. This is relative to the current working directory or open file.
You can figure this out by either using `:pwd` or typing `{count}Ctrl-G`, where count is the number of the open buffer.
(Pressing only Ctrl-G will only show the relative path).
