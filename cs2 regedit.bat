@echo off
chcp 65001 > nul
color 0A
cls

echo ===================================================
echo.
echo      
echo.
echo                       by brange
echo.
echo ===================================================
echo.


echo [+] Disabling Network Throttling...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f > nul


echo [+] Activating Ultimate Power Plan...
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c > nul 2>&1

if %errorlevel% neq 0 (
    powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c > nul
)


echo [+] Cleaning DirectX Shader Cache...
del /q /f /s "%LocalAppData%\D3DSCache\*" > nul 2>&1
del /q /f /s "%LocalAppData%\NVIDIA\DXCache\*" > nul 2>&1
del /q /f /s "%LocalAppData%\AMD\DxCache\*" > nul 2>&1

echo.
echo ===================================================
echo.
echo      All tweaks applied successfully!
echo      Please restart your PC for maximum effect.
echo.
echo ===================================================
echo.
pause
