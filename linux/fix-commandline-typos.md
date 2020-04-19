# Fix commandline typo's

Correct typo's in the previous command using ^:

```sh
^wrong^right

# e.g.
pong google.com

^on^in

ping google.com
```

Open editor for command line (save+exit runs command) uses system's $EDITOR:

```sh
Ctrl+X+E
```

Typing 'fc' (fix command) will open the last command in the $EDITOR and execute it when closing the editor:

```sh
fc
```