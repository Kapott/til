# Logging in shellscripts

Instead of just redirecting every printf to a file, we should log using proper file descriptors whenever we set up our script.

```bash
logfile="/var/log/logfilename_$(date +%F).log"
exec 1>>$logfile # stdout to logfile
exec 2>&1 #stderr to stdout (and thus, logfile in this case)
lls #erronous command, will be logged
ls # output will be logged in logfile
echo "This will be logged in the logfile as well".
```