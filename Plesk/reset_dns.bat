rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";

for /f "tokens=*" %%i in (%file_location%) do (
		"%plesk_cli%\dns.exe" -res %%i -www true -ip 212.42.18.115
)

pause
