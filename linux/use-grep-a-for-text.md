# Always use grep -a for text files

This might seem obvious, but grep sometimes encounters scenario's where it thinks a line is 'binary' because of some unicode characters or strange bytes. If you know you're always going to be grepping through text, tell grep so.

```sh
grep -a '$@' texfile.txt | ..etc...
```