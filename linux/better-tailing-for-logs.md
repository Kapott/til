# Better tailing for logs

First, there is the obvious `tail -f /var/log/filename`. This has it's shortcomings, as in some terminals you can't interrupt the stream and/or scroll up as needed.

But you can also use `less +F /var/log/filename`. This allows you to scroll up if needed.

Just use `Ctrl+c` to detach from the tail and browse the file. Then, reattach to the tail again by hitting `Shift+f`.