@echo off
cd /d "%~dp0"
cls
title Close AI Video Player
echo ==========================================
echo       AI Dual Video Player Closer
echo       Stop Script
echo ==========================================
echo.

echo [INFO] Looking for process listening on port 5173...

set found=0

where powershell >nul 2>nul
if %errorlevel% equ 0 (
    for /f "usebackq tokens=*" %%a in (`powershell -NoProfile -Command "Get-NetTCPConnection -LocalPort 5173 -State Listen -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess | Select-Object -Unique"`) do (
        set found=1
        echo [INFO] Found PID: %%a
        taskkill /F /PID %%a >nul 2>&1
    )
)

if "%found%"=="0" (
    for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":5173" ^| findstr "LISTENING"') do (
        set found=1
        echo [INFO] Netstat Found PID: %%a
        taskkill /F /PID %%a >nul 2>&1
    )
)

if "%found%"=="0" (
    echo [INFO] No running service found on port 5173.
) else (
    echo [SUCCESS] Stop command executed.
)

echo.
echo [DONE] Finished.
pause

