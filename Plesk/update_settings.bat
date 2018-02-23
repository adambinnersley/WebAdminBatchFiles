rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";

for /f "tokens=*" %%i in (%file_location%) do (
		"%plesk_cli%\site.exe" -u %%i -seo-redirect www -asp.net false -err_docs false -ssl true -ssl-redirect true -write_modify true
)

pause
