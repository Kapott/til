#!/usr/bin/env bash

# This script goes through each directory, searches the file for the 
# header tag (single #), and uses that as the link's title.
# Requires ripgrep to be installed!

OUTFILE="README.md"
rm "$OUTFILE" 2> /dev/null && touch "$OUTFILE"

ls -d */ | {
  while read -r line; 
    do 
      fmtline=$(echo $line | tr '-' ' ' | tr '[:lower:]' '[:upper:]') 
      echo "# ${fmtline%?}" >> $OUTFILE
      rg --vimgrep -e '^# ' ./${line}/* |
        awk -F: '$2 == "1" { printf "- [%s](%s)  \n", substr($4,3), substr($1,3) }' |
        sort >> $OUTFILE
    done;
}

git commit "$OUTFILE" -m "Automatic indexing commit."
