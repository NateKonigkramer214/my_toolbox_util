function Patch-Windows {
    # Function to restart the script with elevated privileges
    function Start-ProcessAsAdmin {
        $scriptPath = $MyInvocation.MyCommand.Path
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
        exit
    }

    # Check if the script is running with administrative privileges
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent().IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
        Write-Host "This script requires administrative privileges. Restarting with admin rights..." -ForegroundColor Yellow
        Start-ProcessAsAdmin
    }

    # Check if PSWindowsUpdate module is installed
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Write-Host "PSWindowsUpdate module is not installed. Installing now..." -ForegroundColor Yellow
        try {
            Install-Module PSWindowsUpdate -Force -Scope CurrentUser
            Write-Host "PSWindowsUpdate module installed successfully!" -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to install PSWindowsUpdate module. Error: $_" -ForegroundColor Red
            return
        }
    }

    do {
        Clear-Host
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host " Patching Windows & Installing Security Updates " -ForegroundColor White
        Write-Host "========================================" -ForegroundColor Cyan

        $updateChoice = Read-Host -Prompt "Type 'scan' to run a security scan, 'patch' to start patching, or 'back' to return"
        if ($updateChoice -eq 'back') { return }

        if ($updateChoice -eq 'scan') {
            try {
                Write-Host "Running security scan..." -ForegroundColor Yellow
                # Actual scan for updates
                Import-Module PSWindowsUpdate -ErrorAction Stop
                $availableUpdates = Get-WindowsUpdate -AcceptAll -IgnoreUserInput
                if ($availableUpdates) {
                    Write-Host "Security scan completed. Available updates found!" -ForegroundColor Green
                    $availableUpdates | Format-Table -AutoSize
                    
                    # Prompt user to install available updates
                    $installChoice = Read-Host -Prompt "Would you like to install these updates? (yes/no)"
                    if ($installChoice -eq 'yes') {
                        Write-Host "Installing updates..." -ForegroundColor Yellow
                        Install-WindowsUpdate -AcceptAll -AutoReboot
                        Write-Host "Windows patched and security updates installed!" -ForegroundColor Green
                    }
                    else {
                        Write-Host "Updates not installed." -ForegroundColor Yellow
                    }
                }
                else {
                    Write-Host "Security scan completed. No updates available!" -ForegroundColor Green
                }
            }
            catch {
                Write-Host "Failed to run security scan. Error: $_" -ForegroundColor Red
            }
        }

        if ($updateChoice -eq 'patch') {
            try {
                Write-Host "Patching Windows and installing security updates..." -ForegroundColor Yellow
                # Check for updates again before installation
                $updatesToInstall = Get-WindowsUpdate -AcceptAll -IgnoreUserInput
                if ($updatesToInstall) {
                    Install-WindowsUpdate -AcceptAll -AutoReboot
                    Write-Host "Windows patched and security updates installed!" -ForegroundColor Green
                }
                else {
                    Write-Host "No updates to install." -ForegroundColor Yellow
                }
            }
            catch {
                Write-Host "Failed to patch Windows. Error: $_" -ForegroundColor Red
            }
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

# Ensure this is sourced in your scripts where needed