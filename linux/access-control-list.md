# Using access control lists for fine-grained rights

Sometimes user/group/world rights aren't granular enough.

Add specific rights for a user to a file:

`setfacl -m u:username:rwx filename`

Add ACL to a directory

`setfacl -m g:groupname:rwx directory/`

Remove acl from dir

`setfacl -b directory/`

Check dir acl

`getfacl directory/`

Note:

`ls -al` will put a + behind ugw rights when ACL is enabled.