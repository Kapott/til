# Clone a website with wget

Sometimes we just want to grep through a website to find interesting stuff or parse it later with grep, htmltools, gron etc.
```
wget -m -U "Mozilla/5.0 (compatible; Googlebot/2.1;
+http://www.google.com/bot.html)" $*
```

- Source
	- [@tomnomnom](https://twitter.com/tomnomnom)
