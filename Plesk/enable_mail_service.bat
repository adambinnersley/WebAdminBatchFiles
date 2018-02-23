rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";

for /f "tokens=*" %%i in (%file_location%) do (
		"%plesk_bin%\mail.exe" --update-service "%%i" -status enabled 
)

pause
