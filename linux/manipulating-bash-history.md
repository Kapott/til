# Manipulating the bash history

On most installations, bash has a default option in HISTCONTROL called 'ignorespace'. This prevents commands which start with a space from showing up in the current session's history as well as the bash history logs.

## Disabling history for the session

```
export HISTSIZE=0
```

## Clear history

```
history -c
```

## Clear specific command from history

```
history -d # (where # is the number in the history)
```

## Forget the entire current bash session

Use `kill -9 $$` - $$ contains the uuid of current bash session.