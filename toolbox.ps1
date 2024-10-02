# Dot source the function files
. .\functions\Get-GpuInfo.ps1
. .\functions\Install-Gaming-Apps.ps1
. .\functions\Install-Dev-Tools.ps1
. .\functions\Install-Dev-Apps.ps1
. .\functions\Patch-Windows.ps1

function Show-Menu {
    Clear-Host
    Write-Host "=======================================================" -ForegroundColor Cyan

    # ASCII Art with Colors
    $asciiArt = @"
${cyan}        _____ _____  _   _ _   _ _ _ _                 
${red}__/\__ | ____|__  / | | | | |_(_) (_) |_ _   _  __/\__ 
${yellow}\    / |  _|   / /  | | | | __| | | | __| | | | \    / 
${green}/_  _\ | |___ / /_  | |_| | |_| | | | |_| |_| | /_  _\ 
${magenta}  \/   |_____/____|  \___/ \__|_|_|_|\__|\__, |   \/   
${blue}                                         |___/          
"@

    Write-Host $asciiArt

    Write-Host "=======================================================" -ForegroundColor Cyan
    Write-Host "1. Gaming Setup" -ForegroundColor Green
    Write-Host "   1.1. Install Gaming Apps" -ForegroundColor Yellow
    Write-Host "   1.2. Display GPU Info" -ForegroundColor Yellow
    Write-Host "2. Development Apps" -ForegroundColor Green
    Write-Host "3. Patch Windows & Security Updates" -ForegroundColor Green
    Write-Host "4. Exit" -ForegroundColor Red
}

# Call the function to display the menu
Show-Menu


do {
    Show-Menu
    $mainChoice = Read-Host -Prompt "Choose an option"

    switch ($mainChoice) {
        '1.1' { Install-GamingApps }
        '1.2' { Get-GpuInfo }
        '2' {
            do {
                Clear-Host
                Write-Host "========================================" -ForegroundColor Cyan
                Write-Host "       Development Applications         " -ForegroundColor White
                Write-Host "========================================" -ForegroundColor Cyan
                Write-Host "1. Install Applications" -ForegroundColor Green
                Write-Host "2. Install Development Tools" -ForegroundColor Green
                Write-Host "3. Back" -ForegroundColor Red

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

#Colours

# Define color escape sequences
$red = "`e[31m"
$green = "`e[32m"
$yellow = "`e[33m"
$blue = "`e[34m"
$magenta = "`e[35m"
$cyan = "`e[36m"
$reset = "`e[0m"