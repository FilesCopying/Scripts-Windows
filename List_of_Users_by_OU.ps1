# Last Modified 02 November 2017 by Marcus Batson
# Get-ADComputer https://technet.microsoft.com/en-us/library/ee617192.aspx
# Original Idea from: https://blogs.technet.microsoft.com/askds/2010/02/04/inventorying-computers-with-ad-powershell/
# $FileName = "active_users.csv"
# $ExpirationDate = "10/1/2017"
#Get-ADComputer -Filter{OperatingSystem -Like "*Server*"} -Properties OperatingSystem,LastLogonDate | sort LastLogonDate | Select Name,OperatingSystem,LastLogonDate | Export-csv $FileName -NoTypeInformation -Encoding UTF8


#  Where-Object {$_.LastLogonDate -lt $ExpirationDate} |
#  Select Name,OperatingSystem,LastLogonDate 
# Get-adcomputer -identity cnl-mbatson -properties *
# Get-ADComputer -Identity cnl-mbatson10 -Properties operatingsystem,lastlogondate
# Doesn't work
# $OldComputers = Get-Content computers.csv
# ForEach ($Computer in $OldComputers) {Get-Adcomputer $computer |Remove-ADobject -recursive -WhatIf}
#Source http://www.itprocentral.com/quick-hint-listing-all-users-from-a-specific-ou-using-powershell/

$OULocation = $OkeechobeeCN
$ExportedFileName = "USERs_over_90Days.csv"

$ExpirationDate = "8/2/2017"
Get-ADUser -SearchBase $OULocation -Filter * -Properties LastLogonDate -ResultSetSize 5000 |  Where-Object {$_.LastLogonDate -lt $ExpirationDate} | sort LastLogonDate |Select Name,SamAccountName,LastLogonDate | export-csv $ExportedFilename