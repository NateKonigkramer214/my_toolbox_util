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