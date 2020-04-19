# Count specific lines in specific files in a directory

1. Find all filenames in the current directory and output them

2. Use only files which start with 'foo'

3. Grep those files for lines which don't start with bar, and output the number of lines
   
    find ./ -printf "%f\n" |
    grep '^foo' |
    xargs grep -cv '^bar'
