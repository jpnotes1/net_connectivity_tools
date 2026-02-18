@echo off
echo ===== Network Wait =====
echo.
echo Waiting for network...

:: Network Wait Tool
:: Copyright (c) 2026 Steven Lizama / Authorship Studios All rights reserved.
:: Released under MIT License
:: Use at your own risk. The author is not responsible for any system issues or data loss.

:loop
REM Fast HTTP check to Google (3-second timeout)
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://www.google.com' -UseBasicParsing -TimeoutSec 3; if ($r.StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }"

if errorlevel 1 (
    REM Internet still down, wait a bit and loop
    timeout /t 2 >nul
    goto loop
)

echo Network is up!


