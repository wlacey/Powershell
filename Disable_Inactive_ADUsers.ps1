# Disable Inactive AD Users from Given .csv File

Import-Module ActiveDirectory

# Please provide path for .csv file in the script.
Import-CSV "C:\UsersToDIsable.csv" `
| ForEach-Object {
    $UserAcct = $_."samAccountName"
    try {
        Get-ADUser -Identity $UserAcct | DisableADAccount
    }
    catch {
        Write-Host "User, $UserAcct, does not exist."
    }
}
