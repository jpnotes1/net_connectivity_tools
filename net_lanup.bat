@echo off
echo ===== Lan Check =====
echo.


REM ------------------------------
REM MIT License Info
REM ------------------------------
:: Lan Check
:: Copyright (c) 2026 Steven Lizama / Authorship Studios
:: Released under MIT License

@echo off
powershell -Command "$gw=(Get-NetIPConfiguration).IPv4DefaultGateway.NextHop; if (Test-Connection $gw -Quiet) { Write-Host 'LAN is up' } else { Write-Host 'LAN is down' }"
pause
