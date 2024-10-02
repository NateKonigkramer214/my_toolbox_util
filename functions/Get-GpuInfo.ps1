function Get-SystemInfo {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " System Information " -ForegroundColor White
    Write-Host "========================================" -ForegroundColor Cyan

    # Get the GPU information
    $gpu = Get-WmiObject Win32_VideoController | Where-Object { $_.Name -like "*NVIDIA*" }
    $gpuName = $gpu.Name
    $gpuID = $gpu.DeviceID

    # Get the CPU information
    $cpu = Get-WmiObject Win32_Processor
    $cpuName = $cpu.Name
    $cpuCores = $cpu.NumberOfCores

    # Get the RAM information
    $ram = Get-WmiObject Win32_ComputerSystem
    $totalRam = [math]::round($ram.TotalPhysicalMemory / 1GB, 2)

    # Get the OS information
    $os = Get-WmiObject Win32_OperatingSystem
    $osName = $os.Caption
    $osVersion = $os.Version

    # Display System Information
    Write-Host "Detected GPU: $gpuName" -ForegroundColor Yellow
    Write-Host "GPU Device ID: $gpuID" -ForegroundColor Yellow
    Write-Host "CPU: $cpuName" -ForegroundColor Yellow
    Write-Host "CPU Cores: $cpuCores" -ForegroundColor Yellow
    Write-Host "Total RAM: $totalRam GB" -ForegroundColor Yellow
    Write-Host "Operating System: $osName" -ForegroundColor Yellow
    Write-Host "OS Version: $osVersion" -ForegroundColor Yellow

    Read-Host -Prompt "Press Enter to continue"
}