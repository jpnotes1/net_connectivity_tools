@echo off
echo ===== Router Check =====
echo.
setlocal enabledelayedexpansion

echo Detecting default gateway...

:: Router Check
:: Copyright (c) 2026 Steven Lizama / Authorship Studios All rights reserved.
:: Use at your own risk. The author is not responsible for any system issues or data loss.

set "gateway="

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "Default Gateway"') do (
    set gw=%%A
    set gw=!gw: =!
    if not "!gw!"=="" set "gateway=!gw!"
)

if not defined gateway (
    echo Could not detect a default gateway.
    pause
    exit /b
)

echo Gateway found: %gateway%
echo Pinging gateway...

ping -n 3 %gateway% >nul

if %errorlevel%==0 (
    echo Router is ONLINE.
) else (
    echo Router is OFFLINE or not responding.
)

pause


