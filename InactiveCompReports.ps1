# Inactive Computer Report

Import-Module ActiveDirectory

Write-Host ""
$InactiveDays = Read-Host "Please indicate minimum days of AD computers inactivity: "
$InactiveDate = (Get-Date).AddDays(-($InactiveDays))

$InactiveComps = Get-ADComputer -Filter {LastLogonDate -lt $InactiveDate -and Enabled -eq $true} -Properties LastLogonDate `
| Select-Object Name, LastLogonDate

# Please indicate destination path within the script.
$InactiveComps | Export-Csv C:\InactiveComps.csv
