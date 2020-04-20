# Check expiration date of certificate from shell

Useful for setting up things like monitoring cron jobs or, you know, a SSL checker service.


```sh
 echo | openssl s_client -servername NAME -connect HOST:PORT 2>/dev/null | openssl x509 -noout -dates
```