# Please inidicate destination path within the script.

Get-ADUser -Properties * -Filter * | Export-CSV C:\ADUsers.csv
