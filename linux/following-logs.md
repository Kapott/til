# Following logs, tailing files

First, there is the obvious `tail -f /var/log/filename`.

But you can also use `less +F /var/log/filename`. This allows you to scroll up if needed.
Just use `Ctrl+c` to detach from the tail and browse the file. Then, reattach to the tail again by hitting `Shift+f`.