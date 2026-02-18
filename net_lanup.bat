@echo off
echo ===== Lan Check =====
echo.


REM ------------------------------
REM MIT License Info
REM ------------------------------
:: Lan Check
:: Copyright (c) 2026 Steven Lizama / Authorship Studios  All rights reserved.
:: Released under MIT License
REM Use at your own risk. The author is not responsible for any system issues or data loss.

@echo off
powershell -Command "$gw=(Get-NetIPConfiguration).IPv4DefaultGateway.NextHop; if (Test-Connection $gw -Quiet) { Write-Host 'LAN is up' } else { Write-Host 'LAN is down' }"
pause

