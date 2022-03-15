# Recover Deleted AD User.

# Must have AD Recycle Bin Enabled for this script to work.

$User = Read-Host "Enter the user's name to be recovered: "
try {
    Get-ADObject -Filter "SamAccountName -eq $User" -IncludeDeletedObjects | Restore-ADObject
    Write-Host "User, $User, has been recovered."
}
catch {
    Write-Host "User, $User, does not exist within the AD Recycle Bin or the the Rcycle Bin is not enabled."
}
