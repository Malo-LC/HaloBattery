@echo off
cd /d "%~dp0.."
where uv >nul 2>nul
if errorlevel 1 (
  echo uv is not installed. Install it from https://docs.astral.sh/uv/getting-started/installation/
  pause
  exit /b 1
)
uv sync
if errorlevel 1 (echo Failed to install dependencies & pause & exit /b 1)
start "" ".venv\Scripts\pythonw.exe" halo_battery.pyw
