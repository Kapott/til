# Find all files by date(s)

Useful for making backups, and doing forensics alike, finding files by date - or between dates, is easy:

## Find files newer than date

```
find /somedir -type f -newermt '2020-03-01'
``

## Find files modified between two dates

```
find /somedir -type f -newermt '2020-03-01' ! -newermt '2020-02-01'
```