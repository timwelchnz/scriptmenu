# Install-WindowsUpdates.ps1
# Downloads and installs all available Windows Updates using PSWindowsUpdate

$ProgressPreference = 'SilentlyContinue'
Write-Host "Checking for NuGet provider..."
$nuget = Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue
if (-not $nuget) {
    Write-Host "NuGet provider not found. Installing..."
    Install-PackageProvider -Name NuGet -Force -Confirm:$false -Scope AllUsers
}

# Ensure PowerShell Gallery is trusted
$gallery = Get-PSRepository -Name 'PSGallery' -ErrorAction SilentlyContinue
if ($gallery -and $gallery.InstallationPolicy -ne 'Trusted') {
    Write-Host "Setting PSGallery as a trusted repository..."
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
}

# Check if PSWindowsUpdate module is installed
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "Installing PSWindowsUpdate module..."
    Install-Module -Name PSWindowsUpdate -Force -AllowClobber -Scope AllUsers
}

# Import the module
Import-Module PSWindowsUpdate

# Install all available updates
try {
    Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -Install -Verbose
}
catch {
    Write-Host "Error installing Windows Updates: $_" -ForegroundColor Red
}
