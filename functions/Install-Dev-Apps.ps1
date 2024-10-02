function Install-DevApps {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Installing Development Applications " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $apps = @("VS Code", "Vim", "PuTTY", "Docker", "MobaXterm", "Firefox")
        for ($i = 0; $i -lt $apps.Count; $i++) {
            Write-Host "$($i + 1). $($apps[$i])"
        }
        Write-Host "$($apps.Count + 1). Back"

        $installChoice = Read-Host -Prompt "Choose an option"

        if ($installChoice -eq "$($apps.Count + 1)") { return }

        # Example install process
        if ($installChoice -ge 1 -and $installChoice -le $apps.Count) {
            $app = $apps[$installChoice - 1]
            Write-Host "Installing $app..." -ForegroundColor Yellow
            # Simulate installation
            Start-Sleep -Seconds 2
            Write-Host "$app installed successfully!" -ForegroundColor Green
        }
        else {
            Write-Host "Invalid option, please try again." -ForegroundColor Red
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}