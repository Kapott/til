#!/usr/bin/env bash

# This script goes through each directory, searches the file for the 
# header tag (single #), and uses that as the link's title.

OUTFILE="README.md"
rm "$OUTFILE" 2> /dev/null && touch "$OUTFILE"

ls -d */ | {
  while read -r line; 
    do 
      fmtline=$(echo $line | tr '[:lower:]' '[:upper:]') 
      echo "# ${fmtline%?}" >> $OUTFILE
      rg --vimgrep -e '^# ' ./${line}/* |
        awk -F: '{ printf "- [%s](%s)  \n", substr($4,3), substr($1,3) }' |
        sort >> $OUTFILE
    done;
}
