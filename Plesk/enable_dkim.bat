rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";

for /f "tokens=*" %%i in (%file_location%) do (
		"%plesk_cli%\domain_pref.exe" --update %%i -sign_outgoing_mail true
)

pause
