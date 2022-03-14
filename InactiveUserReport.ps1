# Inactive User Report
# Will be exported to a .csv file.

Import-Module ActiveDirectory

Write-Host ""
$InactiveDays = Read-Host "Please indicate minimum days of AD users with inactivity: "
$InactiveCutoffDate = (Get-Date).AddDays(-($InactiveDays))

$InactiveUsers = Get-AdUser -Filter * -Properties LastLogonDate `
| Where-Object {$_.LastLongOnDate -lt $InactiveCutoffDate} `
| Select-Object Name

# Please indicate destination path within the script.
$InactiveUsers | Export-Csv C:\InactiveUsers.csv

Write-Host "Export of .csv file was succesful."
