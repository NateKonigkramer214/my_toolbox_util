function Show-Menu {
    Clear-Host
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host " User Setup Utility          " -ForegroundColor White
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host "1. Gaming Setup"
    Write-Host "   1.1. Install Gaming Apps"
    Write-Host "   1.2. Monitor Settings"
    Write-Host "   1.3. NVIDIA Updates"
    Write-Host "2. Development Apps"
    Write-Host "3. Patch Windows & Security Updates"
    Write-Host "4. Exit"
}


function Install-GamingApps {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Gaming Applications " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $installChoice = Read-Host -Prompt "Choose an option: `n1. Install Steam `n2. Install Discord `n3. Install Riot Games `n4. Install All `n5. Back"

        switch ($installChoice) {
            '1' {
                Write-Host "Downloading Steam..." -ForegroundColor Yellow
                Start-BitsTransfer -Source "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -Destination "$env:TEMP\SteamSetup.exe"
                Start-Process -FilePath "$env:TEMP\SteamSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Steam installed successfully!" -ForegroundColor Green
            }
            '2' {
                Write-Host "Downloading Discord..." -ForegroundColor Yellow
                Start-BitsTransfer -Source "https://discord.com/api/download?platform=win" -Destination "$env:TEMP\DiscordSetup.exe"
                Start-Process -FilePath "$env:TEMP\DiscordSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Discord installed successfully!" -ForegroundColor Green
            }
            '3' {
                Write-Host "Downloading Riot Games..." -ForegroundColor Yellow
                Start-BitsTransfer -Source "https://install.riotgames.com/installer/RiotGamesSetup.exe" -Destination "$env:TEMP\RiotGamesSetup.exe"
                Start-Process -FilePath "$env:TEMP\RiotGamesSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Riot Games installed successfully!" -ForegroundColor Green
            }
            '4' {
                Write-Host "Downloading Steam, Discord, and Riot Games..." -ForegroundColor Yellow
                Start-BitsTransfer -Source "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -Destination "$env:TEMP\SteamSetup.exe"
                Start-Process -FilePath "$env:TEMP\SteamSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Steam installed successfully!" -ForegroundColor Green
                
                Start-BitsTransfer -Source "https://discord.com/api/download?platform=win" -Destination "$env:TEMP\DiscordSetup.exe"
                Start-Process -FilePath "$env:TEMP\DiscordSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Discord installed successfully!" -ForegroundColor Green
                
                Start-BitsTransfer -Source "https://install.riotgames.com/installer/RiotGamesSetup.exe" -Destination "$env:TEMP\RiotGamesSetup.exe"
                Start-Process -FilePath "$env:TEMP\RiotGamesSetup.exe" -ArgumentList "/silent" -Wait
                Write-Host "Riot Games installed successfully!" -ForegroundColor Green
            }
            '5' { return }
            default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

function Gaming-Settings {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Monitor & NVIDIA Settings " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host "1. Change Monitor Refresh Rate"
        Write-Host "2. Update NVIDIA Drivers"
        Write-Host "3. Back"

        $choice = Read-Host -Prompt "Choose an option"

        switch ($choice) {
            '1' { Change-MonitorRefreshRate }
            '2' { Update-NvidiaDrivers }
            '3' { return }
            default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

function Change-MonitorRefreshRate {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Change Monitor Refresh Rate " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $newRate = Read-Host -Prompt "Enter the desired refresh rate (Hz, e.g., 60, 144) or type 'back' to return"
        if ($newRate -eq 'back') { return }

        try {
            # Simulated change, replace this with the actual implementation
            Write-Host "Monitor refresh rate changed to $newRate Hz." -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to change refresh rate." -ForegroundColor Red
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

function Update-NvidiaDrivers {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Update NVIDIA Drivers " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $updateChoice = Read-Host -Prompt "Type 'update' to start updating or 'back' to return"
        if ($updateChoice -eq 'back') { return }

        try {
            Write-Host "Updating NVIDIA drivers..." -ForegroundColor Yellow
            # Actual update process
            Start-Process -FilePath "C:\Program Files\NVIDIA Corporation\NVIDIA GeForce Experience\NVIDIA GeForce Experience.exe" -ArgumentList "--update" -Wait
            Write-Host "NVIDIA drivers updated successfully!" -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to update NVIDIA drivers." -ForegroundColor Red
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

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

function Patch-Windows {
    do {
        Clear-Host
        Write-Host "====================" -ForegroundColor Cyan
        Write-Host " Patching Windows & Installing Security Updates " -ForegroundColor White
        Write-Host "====================" -ForegroundColor Cyan

        $updateChoice = Read-Host -Prompt "Type 'patch' to start patching or 'back' to return"
        if ($updateChoice -eq 'back') { return }

        try {
            Write-Host "Patching Windows and installing security updates..." -ForegroundColor Yellow
            # Simulated patching, replace with actual process
            Start-Sleep -Seconds 2
            Write-Host "Windows patched and security updates installed!" -ForegroundColor Green
        }
        catch {
            Write-Host "Failed to patch Windows." -ForegroundColor Red
        }

        Read-Host -Prompt "Press Enter to continue"
    } while ($true)
}

do {
    Show-Menu
    $mainChoice = Read-Host -Prompt "Choose an option"

    switch ($mainChoice) {
        '1.1' { Install-GamingApps }
        '1.2' { Change-MonitorRefreshRate }
        '1.3' { Update-NvidiaDrivers }
        '2' {
            do {
                Clear-Host
                Write-Host "====================" -ForegroundColor Cyan
                Write-Host " Development Applications " -ForegroundColor White
                Write-Host "====================" -ForegroundColor Cyan
                Write-Host "1. Install Applications"
                Write-Host "2. Install Development Tools"
                Write-Host "3. Back"

                $devChoice = Read-Host -Prompt "Choose an option"
                switch ($devChoice) {
                    '1' { Install-DevApps }
                    '2' { Install-DevTools }
                    '3' { break }
                    default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
                }

                Read-Host -Prompt "Press Enter to continue"
            } while ($true)
        }
        '3' { Patch-Windows }
        '4' { exit }
        default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
    }

    Read-Host -Prompt "Press Enter to continue"
} while ($true)