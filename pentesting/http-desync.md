# HTTP Desync attack

HTTP Desync attack is HTTP request smuggling, but it abuses `Content-Length` and `Transfer-Encoding: chunked` to desynchronize front- and backend requests.

According to spec:

    If a message is received with both a Transfer-Encoding header field and a Content-Length header field, the latter MUST be ignored.

This means that we can use `Content-Length` and `Transfer-Encoding: chunked` at the same time - and if we can hide the `Transfer-Encoding` header, we desync the requests.



Test example, where frontend uses `Content-Length` and backend uses `Transfer-Encoding`. Frontend will forward all but 'Q', and backend will timeout.

    POST /about HTTP/1.1
    Host: example.com
    Transfer-Encoding: chunked
    Content-Length: 4
    
    1
    Z
    Q

If servers are in sync (both use either Content-Length or Transfer-Encoding), the request will be rejected by the frontend or it will be harmlessly processed by both systems. If the desync occurs the other way around, the front-end will reject the message without ever forwarding it to the back-end.



Test example to detect frontend using `Transfer-Encoding` and backend using `Content-Length`:

    POST /about HTTP/1.1
    Host: example.com
    Transfer-Encoding: chunked
    Content-Length: 6
    
    0
    
    X

Frontend will forward blue text, and backend will timeout waiting for 'X' to arrive. If desync happens other way around, it will poison the back-end with an X - potentially harming legitimate users. (Always use prior detection example first)

Source:

- [portswigger blog](https://portswigger.net/research/http-desync-attacks-request-smuggling-reborn)

- [watchfire paper](https://www.cgisecurity.com/lib/HTTP-Request-Smuggling.pdf) [#](files/HTTP-Request-Smuggling.pdf)


