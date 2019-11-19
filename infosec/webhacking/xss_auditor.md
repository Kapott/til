# XSS Auditor

Can be abused to block stuff.

XSS auditor blocks parts of code which it thinks is XSS. So if you want to block legitimate code (say, config variables?), you make sure that code is reflected in the URI, so the auditor blocks it.

You can then re-create the config variable through e.g. DOM clobbering.
