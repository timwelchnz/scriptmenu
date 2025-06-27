# Force-IntuneSync.ps1
# Forces an Intune Device Sync using Windows.Management.MdmSessionManager

Write-Host "Initiating Intune Device Sync..."
try {
    [Windows.Management.MdmSessionManager,Windows.Management,ContentType=WindowsRuntime]
    $session = [Windows.Management.MdmSessionManager]::TryCreateSession()
    $session.StartAsync()
    Write-Host "Intune sync initiated successfully!"
}
catch {
    Write-Host "Error initiating Intune sync: $_" -ForegroundColor Red
}
