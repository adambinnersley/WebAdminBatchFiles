rem @echo off

set plesk_password = '';

cd "%plesk_cli%"

"%plesk_dir%"\MySQL\bin\mysql.exe -uadmin -p%plesk_password% -P8306 psa -Ne"select name from domains" > c:\all_domains.txt

pause
