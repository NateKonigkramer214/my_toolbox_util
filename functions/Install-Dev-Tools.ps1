function Install-DevTools {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Installing Development Tools " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $tools = @("Python", "Node.js")
        for ($i = 0; $i -lt $tools.Count; $i++) {
            Write-Host "$($i + 1). $($tools[$i])"
        }
        Write-Host "$($tools.Count + 1). Back"

        $installChoice = Read-Host -Prompt "Choose an option"

        if ($installChoice -eq "$($tools.Count + 1)") { return }

        # Example install process
        if ($installChoice -ge 1 -and $installChoice -le $tools.Count) {
            $tool = $tools[$installChoice - 1]
            Write-Host "Installing $tool..." -ForegroundColor Yellow
            # Simulate installation
            Start-Sleep -Seconds 2
            Write-Host "$tool installed successfully!" -ForegroundColor Green
        }
        else {
            Write-Host "Invalid option, please try again." -ForegroundColor Red
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}