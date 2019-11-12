# Manipulating the commandline

Open editor for command line (save+exit runs command) uses system's $EDITOR:

    Ctrl+X+E

Similarly, typing 'fc' (fix command) will open the last command in the $EDITOR and execute it when closing the editor:

    fc

Correct typo's in the previous command:

    ^wrong^right

Example

    kapott@alpha~: whoas byteherder.com
    Command 'whaos' was not found <...>
    
    kapott@alpha~: ^a^i
    
    Domain Name: BYTEHERDER.COM
     Registry Domain ID: 1901088509_DOMAIN_COM-VRSN
     Registrar WHOIS Server: whois.cloudflare.com
     Registrar URL: http://www.cloudflare.com
     (etc.)
