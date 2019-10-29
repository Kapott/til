# Bash history

You can set the history to ignore certain strings. In this example, I've ignored the commands ls, passwd and any command prefixed by the character space.

`export HISTIGNORE="ls:passwd:..etc"`

To disable history for your session you can issue:

`export HISTSIZE=0`

if you have "ignorespace" in HISTCONTROL, then bash wont remember any line beginning with a space character. it won't appear even in the current shell's history, let alone be saved to $HISTFILE.

e.g. I have `export HISTCONTROL='ignoreboth:erasedups'` in my `~/.bashrc`

here's the details from the bash man page:

    HISTCONTROL
    A colon-separated list of values controlling how commands are
    saved on the history list.  If the list of values includes
    ignorespace, lines which begin with a space character are not
    saved in the history list.  A value of ignoredups causes lines
    matching the previous history entry to not be saved.  A value of
    ignoreboth is shorthand for ignorespace and ignoredups.  A value
    of erasedups causes all previous lines matching the current line
    to be removed from the history list before that line is saved.
    Any value not in the above list is ignored.  If HISTCONTROL is
    unset, or does not include a valid value, all lines read by the
    shell parser are saved on the history list, subject to the value
    of HISTIGNORE.  The second and subsequent lines of a multi- line
    compound command are not tested, and are added to the history
    regardless of the value of HISTCONTROL.

# Clearing bash history

Use `history -c`, prepend with space if invisibility is required and HISTCONTROL is ignoring lines with prepended space.

Use `history -d` to delete specific lines.

# Forget the entire bash session

Use `kill -9 $$` - $$ contains the uuid of current bash session.
