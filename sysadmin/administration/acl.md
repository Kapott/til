# ACL usage

add acl to dir

    setfacl -m g:groupname:rwx directory/

remove acl from dir

    setfacl -b directory/

check dir acl

    getfacl directory/

Note:
`ls -al` will put a + behind ugw rights when ACL is enabled.
