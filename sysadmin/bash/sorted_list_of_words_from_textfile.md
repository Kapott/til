# Generate a sorted list of unique words from a textfile

1. Make one-word lines by transliterating the complement (-c) of the alphabet into newlines (note the quoted newline), and squeezing out (-s) multiple newlines.

2. Transliterate upper case to lower case.

3. Sort to bring identical words together.

4. Replace each run of duplicate words with a single representative and include a count (-c).

5. Sort in reverse (-r) numeric (-n) order.

6. Pass through a stream editor; quit (q) after printing the number of lines designated by the script’s first parameter (${1}).
   
    tr -cs A-Za-z '\n' |
    tr A-Z a-z |
    sort |
    uniq -c |
    sort -rn |
    sed ${1}q
