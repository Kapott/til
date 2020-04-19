# mXSS

Mutation XSS

[AppSec EU 2013: How mXSS attacks change everything we believed to know so far](https://www.youtube.com/watch?v=Haum9UpIQzU)

[Slides in PDF form](files/slidesmarioheiderich.pdf)



mXSS is a new type of XSS attack by Mario Heiderich. 

The vulnerability in question comes from innerHTML which allows direct manipulation of HTML content, bypassing the DOM. An elements innerHTML is non-idempotent. The browser manipulates the contents to fix and optimize errors with the HTML. This is very visible in the [example](http://html5sec.org/innerhtml/#%3Cdiv%3E123) given in the slides. 

The problem with this manipulation is that it sometimes introduces flaws that is not apparent at first sight. One good [example](http://html5sec.org/innerhtml/#%3Cimg%20src=%22foo%22%20alt=%22%60%60onerror=alert%281%29%22%20/%3E) is also in the slides.

The big deal about this attack is that it bypasses (at the time of the talk, situation may be better now) most of the existing XSS filters and sanitizers.
