rem @echo off

set plesk_password = '';

cd "%plesk_cli%"

plesk db "select name from domains" > c:\all_domains.txt

pause
