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