# Clone a website with wget

Sometimes we just want to grep through a website to find interesting stuff or parse it later with grep, htmltools, gron etc.

    ```
    export ua="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
    
    wget -m \
    -U "${ua}" \
    $*
    ```

- Source
  - [@tomnomnom](https://twitter.com/tomnomnom)


