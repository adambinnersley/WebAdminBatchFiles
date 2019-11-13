rem @echo off

set file_location = "c:\Users\Administrator\Desktop\domains.txt";
set defaultmailpassword = "mypassword";

for /f "tokens=*" %%i in (%file_location%) do (
    plesk bin mail.exe -c info@%%i -passwd %defaultmailpassword% -mailbox true -aliases add:student
)

pause
