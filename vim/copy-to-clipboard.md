# Copy to clipboard with VIM

This is tricky in linux, as linux has the 'PRIMARY' and the 'CLIPBOARD'. Windows and mac only have one clipboard, so it's less tricky there.

Vim has two special registers:

`*` and `+`

So you can 

Register select star and yyank into it: `"*yy` (yanks into PRIMARY, middle-click paste)

or

Register select plus and yyank into it: `"+yy` (yanks into CLIPBOARD, ctrl-shift-v paste (usually))

## Map it to a leader shortcut

I'm not quite there yet with using registers, so I'll just use these quality of life binds:

```vim
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
```

## Automagically yank and paste from system clipboard

Linux PRIMARY

```vim
set clipboard=unnamed
```

Linux CLIPBOARD (cut register)

```vim
set clipboard=unnamedplus
```