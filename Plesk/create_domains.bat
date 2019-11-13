rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";
set subscription = "mysubscription.co.uk";
set defaultmailpassword = "mypassword";
set ssl_notify = "info@example.com";
set server_ip = "127.0.0.1";

for /f "tokens=*" %%i in (%file_location%) do (
    "%plesk_cli%\site.exe" -c %%i -webspace-name %subscription% -hosting true -www-root %%i -php true -seo-redirect www -asp.net false -err_docs false -ssl true -write_modify true
    "%plesk_cli%\extension.exe" --exec letsencrypt cli.php -d %%i -d www.%%i -m %ssl_notify%
    plesk bin mail.exe --update-service "%%i" -status enabled
    plesk bin mail.exe -c info@%%i -passwd %defaultmailpassword% -mailbox true -aliases add:student
    "%plesk_cli%\domain_pref.exe" --update %%i -sign_outgoing_mail true
    "%plesk_cli%\dns.exe" -res %%i -www true -ip %server_ip%
    "%plesk_cli%\site.exe" -u %%i -seo-redirect www -asp.net false -err_docs false -ssl true -ssl-redirect true -write_modify true
)

pause
