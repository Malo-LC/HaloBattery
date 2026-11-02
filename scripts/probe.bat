@echo off
chcp 65001 >nul
cd /d "%~dp0.."
where uv >nul 2>nul
if errorlevel 1 (
  echo uv is not installed. Install it from https://docs.astral.sh/uv/getting-started/installation/
  pause
  exit /b 1
)
uv run python halo_battery.pyw --probe
pause
