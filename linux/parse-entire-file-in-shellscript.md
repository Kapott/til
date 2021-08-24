# Parse an entire file in a shellscript

By changing the default filedescriptor to the input of our file, we can process a file line by line.  
What's more, we can log whilst we're processing.  


```bash
#!/usr/bin/env bash

# Simple example which reads some csv file, logs the selected field to some logfile
# and shows us the progress during the entire operation.

READFILE="$1" # arg 1 is the file we're going to read from
LOGFILE="$2" # arg 2 is the file we're going to log the output to
FIELDS="$3" # arg 3 is heavy-handedly passed through to the cut command as the fields we want

exec 4> "$LOGFILE" # open filedescriptor

linecount=1
totallines=$(wc -l "$1")

while read -ru 3 LINE; do
    output=$(echo $LINE | cut -d , -f"$3") # give me the fields out of arg 3
    echo "$output" >4 # log the output of those fields

    echo -ne "Processed $linecount / $totallines lines.\r" # show us some progress
    linecount=$(( $linecount + 1 ))
done < "$READFILE"

echo -ne "\n\n"

```