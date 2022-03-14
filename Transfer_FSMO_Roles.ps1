# Transfer a single FSMO Role
# Must have at least domain admin and schema admin rights to transfer roles.

# This section of code will allow the admin to view all FSMO roles.
Write-Host ""
Write-Host "List of Forest-wide FSMO roles."
Get-ADForest | Format-List DomainNamingMaster, SchemaMaster
Write-Host "List of Domain-wide FSMO roles."
Get-ADDomain | Format-List InfrastructureMaster, PDCEmulator, RIDMaster


# Admin will provide the target domain controller where the FSMO role will be transfered.
 $TargetDC = Read-Host "Please provide the target domain controller: "

 # Will provide the admin a list of roles to choose from.
 Write-Host "1 - DomainNamingMaster"
 Write-Host "2 - SchemaMaster"
 Write-Host "3 - InfrastructureMaster"
 Write-Host "4 - PDCEmulator"
 Write-Host "5 - RIDMaster"

 # Admin will provide the FSMO role to be transfered.
 $Role = Read-Host "Please provide the corresponding number to the FSMO role to transfer: "
 Switch ($Role) {
    1 {$ValidRole = 'DomainNamingMaster'}
    2 {$ValidRole = 'SchemaMaster'}
    3 {$ValidRole = 'InfrastructureMaster'}
    4 {$ValidRole = 'PDCEmulator'}
    5 {$ValidRole = 'RIDMaster'}
}

 # Validate the admin's input.
 if ($Role -lt 1 -or $Role -gt 5) {
 Write-Host "ERROR - Must input a number corresponding to the FSMO role."
 }

 # Transfer Domain Naming Master role to the target server.
  if ($Role -eq 1) {
  Move-ADDirectoryServerOperationMasterRole -OperationMasterRole DomainNamingMaster -Identity $TargetDC -confirm:$true
  Write-host "$ValidRole has been transferred to $TargetDC."
  }

  # Transfer Schema Master role to the target server.
  if ($Role -eq 2) {
  Move-ADDirectoryServerOperationMasterRole -OperationMasterRole SchemaMaster -Identity $TargetDC -confirm:$true
  Write-host "$ValidRole has been transferred to $TargetDC."
  }

  # Transfer Infrastructure Master role to the target server.
  if ($Role -eq 3) {
  Move-ADDirectoryServerOperationMasterRole -OperationMasterRole InfrastructureMaster -Identity $TargetDC -confirm:$true
  Write-host "$ValidRole has been transferred to $TargetDC."
  }

  # Transfer PDC Emulator role to the target server.
  if ($Role -eq 4) {
  Move-ADDirectoryServerOperationMasterRole -OperationMasterRole PDCEmulator -Identity $TargetDC -confirm:$true
  Write-host "$ValidRole has been transferred to $TargetDC."
  }

  # Transfer RID Master role to the target server.
  if ($Role -eq 5) {
  Move-ADDirectoryServerOperationMasterRole -OperationMasterRole RIDMaster -Identity $TargetDC -confirm:$true
  Write-host "$ValidRole has been transferred to $TargetDC."
  }
