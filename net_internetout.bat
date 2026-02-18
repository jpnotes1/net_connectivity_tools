@echo off
setlocal enabledelayedexpansion
echo ===== Home Internet Recovery Monitor =====
echo.


REM ------------------------------
REM MIT License Info
REM ------------------------------
:: Home Internet Recovery Monitor
:: Copyright (c) 2026 Steven Lizama / Authorship Studios  All rights reserved.
:: Released under MIT License
REM Use at your own risk. The author is not responsible for any system issues or data loss.

REM ------------------------------
REM Step 1: Wait for router (LAN)
REM ------------------------------
echo Waiting for router to power on / LAN to be ready...

:waitrouter
set "gateway="

REM Grab the first non-empty IPv4 default gateway
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R "Default Gateway"') do (
    set gw=%%A
    set gw=!gw: =!
    if not "!gw!"=="" (
        set "gateway=!gw!"
        goto gotgateway
    )
)

REM No gateway found
echo No router detected. Waiting...
ping -n 2 127.0.0.1 >nul
goto waitrouter

:gotgateway
REM Ping the gateway once with 1 second timeout
ping -n 1 -w 1000 %gateway% >nul
if errorlevel 1 (
    echo Router offline or not responding: %gateway%
    ping -n 2 127.0.0.1 >nul
    goto waitrouter
)

echo Router is reachable: %gateway%
echo.

REM ------------------------------
REM Step 2: Get assigned IP
REM ------------------------------
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /C:"IPv4 Address"') do (
    set MYIP=%%i
    goto gotIP
)
:gotIP
set MYIP=%MYIP: =%
echo Assigned IP: %MYIP%
echo.

REM ------------------------------
REM Step 3: Wait for internet (external check)
REM ------------------------------
echo Checking upstream / internet connectivity...
set COUNT=0

:waitinternet
ping -n 1 -w 1000 8.8.8.8 >nul
if errorlevel 1 (
    set /a COUNT+=1
    echo Internet offline, attempt %COUNT%
    if %COUNT% GEQ 10 (
        echo Internet still down.
        echo Call your ISP:
        echo Xfinity/Comcast: 800-934-6489
        echo Spectrum: 833-949-0036
        echo Frontier: 855-559-0155
        goto endscript
    )
    ping -n 1 -w 500 127.0.0.1 >nul
    goto waitinternet
)

echo Internet is reachable!

:endscript
pause


