@echo off
echo ===== Network Wait =====
echo.
echo Waiting for network...

REM ------------------------------
REM MIT License Info
REM ------------------------------
:: Network Wait Tool
:: Copyright (c) 2026 Steven Lizama / Authorship Studios
:: Released under MIT License

:loop
REM Fast HTTP check to Google (3-second timeout)
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://www.google.com' -UseBasicParsing -TimeoutSec 3; if ($r.StatusCode -eq 200) { exit 0 } else { exit 1 } } catch { exit 1 }"

if errorlevel 1 (
    REM Internet still down, wait a bit and loop
    timeout /t 2 >nul
    goto loop
)

echo Network is up!
