# CORS



## No origins

If you see a HTTP response with any Access-Control-* headers but
 no origins declared, this is a strong indication that the server will 
generate the header based on your input. Other servers will only send 
CORS headers if they receive a request containing the Origin header, 
making associated vulnerabilities extremely easy to miss.

## null origin

The specification mentions it being triggered by redirects, and a few stackoverflow posts show that local HTML files also get it ([spec](https://www.w3.org/TR/cors/#access-control-allow-origin-response-header)). (...) quite a few websites whitelist it (...). Great for attacker, as `null` origin can be obtained by iframe.

```html
<iframe sandbox="allow-scripts allow-top-navigation allow-forms" src='data:text/html,<script>*cors stuff here*</script>’></iframe>
```

Shodan search:

`https://www.shodan.io/search?query=%22Access-Control-Allow-Origin%3A+null%22`



## breaking parsers

Most handle origin as string, some parse it as url.

Safari valid url:

`http://example.com%60.hackxor.net/static/cors.html`

Gives CORS header of:

    Origin: http://example.com\`.hackxor.net/

Parsed as `hostname` = `example.com`.



    "..If you find that you can use _ instead of ` then you can also exploit people using Firefox and Chrome.." (see 'Advanced CORS techniques in sources')





Sources:

- [portswigger](https://portswigger.net/research/exploiting-cors-misconfigurations-for-bitcoins-and-bounties)

- [Evan J](https://ejj.io/misconfigured-cors/)

- [Corben - Advanced CORS techniques](https://www.corben.io/advanced-cors-techniques/)


