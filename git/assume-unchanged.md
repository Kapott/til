# Assume a file is unchanged

Useful for when you changed something you don't want to accidentally commit to the repository.


Assume the file is unchanged.
```
git update-index --assume-unchanged <file>
```

Undo the assumption.
```
git update-index --no-assume-unchanged <file>
```

List all the current assumptions.
```
git ls-files -v | grep '^[a-z]'
```
