# Inactive Computer Report
# Will be exported to a .csv file.

Import-Module ActiveDirectory

Write-Host ""
$InactiveDays = Read-Host "Please indicate minimum days of AD computers inactivity: "
$InactiveDate = (Get-Date).AddDays(-($InactiveDays))

$InactiveComps = Get-ADComputer -Filter {LastLogonDate -lt $InactiveDate -and Enabled -eq $true} -Properties LastLogonDate `
| Select-Object Name, LastLogonDate

# Please indicate destination path within the script.
$InactiveComps | Export-Csv C:\InactiveComps.csv

Write-Host "Export of .csv file was succesful."
