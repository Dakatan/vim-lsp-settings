@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/Pure-D/serve-d/releases/latest`) do set VERSION=%%~nxV
set FILE="serve-d_%VERSION:~1%-windows.zip"
curl -L -o %FILE% https://github.com/Pure-D/serve-d/releases/download/%VERSION%/%FILE%
call "%~dp0\run_unzip.cmd" %FILE%
del %FILE%
