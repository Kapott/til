# Iframes

I've always heard iframes are dangerous and should be avoided from both a security and usability point-of-view. So what I'm interested in is, of course. what  vectors does the iframe offer?

Get document's iframes

    var frames = document.getElementByTagName('iframe');
    for (var frame in frames)
        frame.contentWindow.frames[1].name = 'foo'

`window.postMessage`

If there is no origin check when message sent from the parent via postMessage, check if you can use the postMessage as a gadget to manipulate the behaviour of the enclosed site.



`No X-Frame-Options header`

This means the victim site can be embedded as an iframe. If that victim site has an iframe in it (e.g. Recaptcha). You can then control, for instance,  the `src` of an iframe using the attacker's to manipulate the victim's site's iframe. This does not violate same-origin policy. 

You can also do stuff like DOM Clobbering on the victim site using this technique, by changing the name or id of the victm site's iframe.



`allow-scripts and allow-same-origin on page.origin == iframe.origin sites.`

    Setting both the allow-scripts and allow-same-origin keywords together when the embedded page has the same origin as the page containing the iframe allows the embedded page to simply remove the sandbox attribute and then reload itself, effectively breaking out of the sandbox altogether.
