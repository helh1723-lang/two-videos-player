@echo off
cd /d "%~dp0"
cls
title AI Video Player Launcher
echo ==========================================
echo       AI Dual Video Player Launcher
echo       Start Script
echo ==========================================
echo.

echo [INFO] Checking Node.js...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js not found.
    echo [INFO] Install Node.js from https://nodejs.org/
    echo.
    pause
    exit /b
)

echo [INFO] Checking npm...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] npm not found.
    echo [INFO] Reinstall Node.js with npm, or check PATH.
    echo.
    pause
    exit /b
)

if not exist "node_modules" (
    echo [INFO] node_modules not found, installing dependencies...
    call npm install
    if errorlevel 1 (
        echo [ERROR] npm install failed.
        pause
        exit /b
    )
)

echo [INFO] Building production files...
call npm run build
if errorlevel 1 (
    echo [ERROR] Build failed.
    pause
    exit /b
)

echo [INFO] Starting preview server...
echo [INFO] Keep this window open.
echo.

call npm run preview -- --port 5173 --host 127.0.0.1 --open
if errorlevel 1 (
    echo.
    echo [ERROR] Preview server exited unexpectedly.
    pause
)
pause

