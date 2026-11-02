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
uv run python tools\make_icon.py halo.ico
uv run python tools\make_version.py version_info.txt
uv run python -m PyInstaller --noconfirm --onedir --windowed --noupx --name HaloBattery --icon halo.ico --version-file version_info.txt --hidden-import hid --hidden-import pystray._win32 halo_battery.pyw
echo.
echo Done: dist\HaloBattery\HaloBattery.exe (keep the whole HaloBattery folder together)
pause
