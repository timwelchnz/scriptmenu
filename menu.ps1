# Script Menu System
# Author: Tim Welch
# Created: June 28, 2025

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

function Show-Menu {
    Clear-Host
    Write-Host "================================"
    Write-Host "      PowerShell Script Menu     "
    Write-Host "================================"
    Write-Host "1. Force Intune Device Sync"
    Write-Host "2. Install Windows Updates"
    Write-Host "3. Show Network Connection Status"
    Write-Host "Q. Quit"
    Write-Host "================================"
}

# Main menu loop
do {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    
    switch ($selection) {
        '1' {
            # Download and run Force-IntuneSync.ps1 from GitHub
            $scriptUrl = "https://raw.githubusercontent.com/timwelchnz/scriptmenu/main/Force-IntuneSync.ps1"
            try {
                Write-Host "Downloading and running Intune Sync script..."
                iwr -Uri $scriptUrl -UseBasicParsing | iex
            }
            catch {
                Write-Host "Failed to download or run the Intune sync script: $_" -ForegroundColor Red
            }
            pause
        }
        '2' {
            # Download and run Install-WindowsUpdates.ps1 from GitHub
            $scriptUrl = "https://raw.githubusercontent.com/timwelchnz/scriptmenu/main/Install-WindowsUpdates.ps1"
            try {
                Write-Host "Downloading and running Windows Update script..."
                iwr -Uri $scriptUrl -UseBasicParsing | iex
            }
            catch {
                Write-Host "Failed to download or run the update script: $_" -ForegroundColor Red
            }
            pause
        }
        '3' {
            # Download and run get-NetworkConnectionStatus.ps1 from GitHub
            $scriptUrl = "https://raw.githubusercontent.com/timwelchnz/scriptmenu/main/get-NetworkConnectionStatus.ps1"
            try {
                Write-Host "Downloading and running Network Connection Status script..."
                iwr -Uri $scriptUrl -UseBasicParsing | iex
            }
            catch {
                Write-Host "Failed to download or run the network status script: $_" -ForegroundColor Red
            }
            pause
        }
        'Q' {
            return
        }
        default {
            Write-Host "Invalid selection. Please try again."
            pause
        }
    }
} while ($true)
