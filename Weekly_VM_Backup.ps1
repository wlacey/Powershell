# Weekly VM Backup

Install-WindowsFeature RSAT-Hyper-V-Tools

# Grabs all virtual machines.
$VirtualMachines = Get-VM
# Define current date.
$CurrentDate = Get-Date -Format yyyyMMMdd
# Please indicate destination path in the script for the VM backups.
$DestinationFolder = "C:\"

foreach($VM in $VirtualMachines) {
    $VMBackup = $VM.Name
    New-Item -ItemType Directory -Path "$DestinationFoldrer\$VMBackup"
    New-Item -ItemType Directory -Path "$DestinationFoldrer\$VMBackup\$CurrentDate"
    Export-VM -VM $VM -Path "$DestinationFoldrer\$VMBackup\$CurrentDate"
    Get-ChildItem "$DestinationFoldrer\$VMBackup" `
    | Sort-Object -Property CreationTime -Descending `
    | Select-Object -Skip 7 `
    | Remove-Item -Recurse 
}
