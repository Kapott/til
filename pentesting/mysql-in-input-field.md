# MySQL input

Sometimes applications with 'platform' identities allow you to input sophisticated queries. Sometimes these queries have access to things they should not have access to.



For MySQL you can try local file inclusion:

```sql
LOAD DATA LOCAL INFILE '/etc/passwd' INTO TABLE dadadb.dadatable FIELDS TERMINATED BY "\n"
```


