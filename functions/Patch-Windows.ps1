function Patch-Windows {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Patching Windows & Installing Security Updates " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

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