# Enable AD Recycle Bin

# Admin will provide the names of the domain and domain controller.
$Domain = Read-Host "Please provide the name of the domain: "
$DomainController = Read-Host "Please provde the name of the domain controller: "

Enable-ADOptionalFeature -Identity 'Recycle Bin Feature' -Scope ForestConfigurationSet -Target $Domain -Server -DomainController -Confirm:$true 
