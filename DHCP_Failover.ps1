# Create IPv4 Failover Relationship on DHCP Server

# Admin will provide the target server running the DHCP service.
$TargetServer = Read-Host "Provide name of the target server: "

# Admin will provide partner DHCP server with which the failover relationship is created.
$PartnerServer = Read-Host "Provide name of the partnered server: "

# Admin will provide the failover name.
$Failover = Read-Host "Provide name of the failover: "

# Admin will provide the scopes in IPv4 format; eg., "x.x.x.x,y.y.y.y".
$ScopeID = Read-Host "Provide the scope identifiers in IPv4 format: "

# Admin will provide the shared secret/key between the servers for message digest authentication.
$Secret = Read-Host "Provide the shared secret/key: "

#IPv4 failover relaitionship on DHCP server will be created.
Add-DhcpServerv4Failover -ComputerName $TargetServer -Name $Failover -PartnerServer $PartnerServer -ScopeId $ScopeID -SharedSecret $Secret -Confirm :$true
