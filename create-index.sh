#!/usr/bin/env bash

OUTFILE="README.md"
rm "$OUTFILE" 2> /dev/null && touch "$OUTFILE"

# rg --vimgrep -e '^# ' . | awk -F: '{ printf "- [%s](%s)  \n", substr($4,3), substr($1,3) }' | sort > $OUTFILE

ls -d */ | {
  while read -r line; 
    do 
      fmtline=$(echo $line | tr '[:lower:]' '[:upper:]')
      echo "# ${fmtline%?}" >> $OUTFILE
      rg --vimgrep -e '^# ' ./${line}/* | awk -F: '{ printf "- [%s](%s)  \n", substr($4,3), substr($1,3) }' | sort >> $OUTFILE
    done;
}
