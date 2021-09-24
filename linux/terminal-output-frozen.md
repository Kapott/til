# Terminal output frozen

If you're running bash and hit `Ctrl+S`, your terminal froze. This can happen by accident if you wanted to type `Ctrl-a` for example.
The solution is simple; hit `Ctrl+q` to resume the output.

You can turn off these shenanigans in your `.bashrc` or `.bash_profile` by pasting the following line into it:

```bash
stty -ixon
```

If you want to re-enable the flow control keys, use:

```bash
stty ixany
```
