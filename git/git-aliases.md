# Git aliases

For usage in the ~/.gitconfig under the `[aliases]` section.

## Show today's work for current branch

```
today = log --pretty=format:"[%h] %s [%cn]" --since="yesterday"
```

## Commits without colors, for piping

```
lnc = log --pretty=format:"%h %s [%cn]"
```

## Miscellanious aliases
  
``` 
cp = cherry-pick
ci = commit
co = checkout
br = branch
diff = diff --word-diff
dc = diff --cached

r = reset
rh = reset --hards
r1 = reset HEAD^
r2 = reset HEAD^^

sl = stash list
sa = stash apply
ss = stash save
```