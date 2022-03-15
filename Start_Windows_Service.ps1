# Start a Windows Service

# Admin will input the service to start.
$Service = Read-Host "Enter the service's name you wish to start: "
Write-Host ""

try {
    # Will retrieve the service's info.
    $ServiceData = Get-Service -Name $Service -ErrorAction Stop
    if ($ServiceData.Status -ne "Running") {
        Write-Host "Attempting to start service, $Service..."
        Start-Service -Name $Service
        $ServiceData.Refresh()
        Write-Host ""
        Write-Host $ServiceData.Status
    }
    else {
        Write-Host "Service, $Service, is already running."
    }
}
catch {
    Write-Host "Service, $Service, does not exist."
}
