# Script Menu

A PowerShell script menu system for common administrative tasks.

## Features

- Force Intune Device Sync
- Install Windows Updates (using PSWindowsUpdate module)

## Quick Start

To run the script menu directly from PowerShell, use:

```powershell
iwr -uri "https://raw.githubusercontent.com/timwelchnz/scriptmenu/main/menu.ps1" | iex
```
or
```
iwr -uri "https://tinyurl.com/rmmmenu" | iex
```

## Requirements

- Windows PowerShell 5.1 or PowerShell Core 7.x
- Administrative privileges
- Internet connectivity for downloading scripts
- PSWindowsUpdate module (automatically installed if needed)

## Available Options

1. **Force Intune Device Sync** - Forces an immediate sync with Intune for device compliance and policy updates
2. **Install Windows Updates** - Checks for and installs all available Windows updates using the PSWindowsUpdate module

## Notes

- Some functions require administrative privileges
- Windows Update installation may require a system restart
- All scripts are designed to be run in an interactive PowerShell session