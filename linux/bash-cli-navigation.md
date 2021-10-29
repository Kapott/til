# Bash command line navigation

Ever wonder how you can correct that command you were typing without backspacing a bazillion times or holding down arrow keys? Now you know. (Note: These are emacs-based keybinds.)

```
Move to end of line                     Ctrl+e
Move to start of line                   Ctrl+a
Move forward one word                   Alt+f
Move backward one word                  Alt+b

Cut from position to end of line        Ctrl+k
Cut from position to start of line      Ctrl+u
Paste to end of line                    Ctrl+y

Cut word backwards                      Ctrl+w
```

Good to know:

If you're on a "shit, should've prepended sudo" moment, instead of typing it out and then using `sudo !!`, you can just type `Ctrl+u`, type `sudo`, `Ctrl+y` and you've prepended `sudo` to the command instead.
