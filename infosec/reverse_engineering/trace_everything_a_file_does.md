# Trace every low level operation a file performs

This is not only nice to see what a certain binary is doing, but you can also
use this to see when, why and how a file is being opened.

    sudo strace -f -o <filename.trace> su user -c 'mycommand'
