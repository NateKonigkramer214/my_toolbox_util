function Show-Menu {
    Clear-Host
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host " User Setup Utility          " -ForegroundColor White
    Write-Host "============================" -ForegroundColor Cyan
    Write-Host "1. Gaming Setup"
    Write-Host "   1.1. Install Gaming Apps"
    Write-Host "2. Development Apps"
    Write-Host "3. Patch Windows & Security Updates"
    Write-Host "4. Exit"
}

function Get-GpuInfo {
    Clear-Host
    Write-Host "====================" -ForegroundColor Cyan
    Write-Host " GPU Information " -ForegroundColor White
    Write-Host "====================" -ForegroundColor Cyan

    # Get the GPU information
    $gpu = Get-WmiObject Win32_VideoController | Where-Object { $_.Name -like "*NVIDIA*" }
    $gpuName = $gpu.Name
    $gpuID = $gpu.DeviceID

    # Display GPU Information
    Write-Host "Detected GPU: $gpuName" -ForegroundColor Yellow
    Write-Host "GPU Device ID: $gpuID" -ForegroundColor Yellow

    Read-Host -Prompt "Press Enter to continue"
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
    Clear-Host
    Write-Host "====================" -ForegroundColor Cyan
    Write-Host " Patching Windows " -ForegroundColor White
    Write-Host "====================" -ForegroundColor Cyan

    Write-Host "Checking for Windows Updates..." -ForegroundColor Yellow
    # Simulate checking for updates
    Start-Sleep -Seconds 2
    Write-Host "Downloading and Installing Windows Updates..." -ForegroundColor Yellow
    # Simulate downloading and installing updates
    Start-Sleep -Seconds 5
    Write-Host "Windows is up to date!" -ForegroundColor Green

    Read-Host -Prompt "Press Enter to continue"
}


do {
    Show-Menu
    $mainChoice = Read-Host -Prompt "Choose an option"

    switch ($mainChoice) {
        '1.1' { Install-GamingApps }
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
