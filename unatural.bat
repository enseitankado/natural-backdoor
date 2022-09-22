@echo off

rem USE TURKISH CHRACTER TABLE
chcp 1254

rem DROP ACCOUNT
net user Default /del

rem HIDE BACKDOOR USER ACCOUNT FROM CONTROL PANEL AND LOGON SCREEN
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\Userlist" /v Default /f

rem PERMIT FILE SHARING ON FIREWALL
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=no
netsh advfirewall firewall set rule group="dosya ve yazici paylasimi" new enable=no

rem DISABLE ADMINISTRATIVE SHARES
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 0

rem DISABLE EMPTY PASSWORD ACCOUNT SECURITY
reg delete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 1

