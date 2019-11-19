# Content-security-policy

Adds HTTP header `content-security-policy` which tells the browser some rules about what is allowed to run on the page.

## Related to JS injection

Value of CSP contains a nonce. This nonce gets used on every script tag on the page. If you inject javascript without the nonce, it won't get executed.
