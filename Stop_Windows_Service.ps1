# Stop a Windows Service

# Admin will input the service to stop.
$Service = Read-Host "Enter the service's name you wish to stop: "
Write-Host ""

try {
    # Will retrieve the service's info.
    $ServiceData = Get-Service -Name $Service -ErrorAction Stop
    if ($ServiceData.Status -ne "Stopped") {
        Write-Host "Attempting to stop service, $Service..."
        Stop-Service -Name $Service
        $ServiceData.Refresh()
        Write-Host ""
        Write-Host $ServiceData.Status
    }
    else {
        Write-Host "Service, $Service, is currently not running."
    }
}
catch {
    Write-Host "Service, $Service, does not exist."
}
