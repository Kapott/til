# Use arguments of the previous command on the current line

E.g. 
`ping 8.8.8.8`

And then you want to traceroute to it:
`mtr --curses 8.8.8.8`

You can instead type:
`mtr --curses` followed by `Alt+.`

This will paste the arguments of the previous command to the current line.