@echo OFF
(for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A) > DCWinVer.ps1
powershell.exe -ExecutionPolicy Bypass -noexit "& '.\DCWinVer.ps1'"
:eof

:::import-module activedirectory
:::Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion,LastLogonDate | Export-CSV C:\AllWindowsVersions.csv -NoTypeInformation -Encoding UTF8
:::$From = "$env:computername@$env:userdomain.com"
:::$To = "jwagner@jrdtech.com"
:::$Attachment = "C:\AllWindowsVersions.csv"
:::$Subject = "WinVer for all Machines from $env:computername"
:::$Body = "This is an Automated PowerShell script that creates this data and sends it"
:::$SMTPServer = "mail.optonline.net"
:::$SMTPPort = "25"
::: Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Attachments $Attachment
