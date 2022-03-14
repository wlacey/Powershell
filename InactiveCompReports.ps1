# Inactive Computer Report

Import-Module ActiveDirectory

Write-Host ""
$InactiveDays = Read-Host "Please indicate how many days beyond that the AD computers are inactive: "
$InactiveDate = (Get-Date).AddDays(-($InactiveDays))

$InactiveComps = Get-ADComputer -Filter {LastLogonDate -lt $InactiveDate -and Enabled -eq $true} -Properties LastLogonDate `
| Select-Object Name, LastLogonDate

$InactiveComps |Export-Csv C:\InactiveComps.csv
