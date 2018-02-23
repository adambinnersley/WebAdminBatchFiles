@echo off

set delete_after = 10; REM Days
set backup_location = "B:\Backup\";
set mail_host = "mail.ldcmailhost1.co.uk"
set auth_email = "auth@example.com";
set auth_pass = "Password123";

set notify_email = "notify@example.com";

blat -install %mail_host% %auth_email% 3 25 - %auth_email% %auth_pass%

md "%backup_location%Backup_%date:~-10,2%_%date:~-7,2%_%date:~-4,4%"
md "%backup_location%Backup_%date:~-10,2%_%date:~-7,2%_%date:~-4,4%\service"
md "%backup_location%Backup_%date:~-10,2%_%date:~-7,2%_%date:~-4,4%\mail"
echo Backing up config files...
robocopy "C:\Program Files (x86)\SmarterTools\SmarterMail\Service" "%backup_location%Backup_%date:~-10,2%_%date:~-7,2%_%date:~-4,4%\service" *.xml /ZB
echo Backing up mailboxes...
robocopy "C:\SmarterMail" "%backup_location%Backup_%date:~-10,2%_%date:~-7,2%_%date:~-4,4%\mail" /MIR /R:6 /W:10 /ZB

IF %ERRORLEVEL% LSS 8 goto finish
REM Something failed & goto :eof
blat -to %notify_email% -f %auth_email% -subject "Failed Mail Backup" -body "The backup encountered an error :\n\r\n\r Robocopy error level :%ERRORLEVEL%"
:finish
REM All done, no fatal errors.
blat -to %notify_email% -f %auth_email% -subject "Mail Backup Successful" -body "The SmarterMail backup has successfully been carried out"

forfiles -p %backup_location% -d -%delete_after% -c "cmd /c IF @isdir == TRUE rd /S /Q @path"