@echo off

for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/jaredly/reason-language-server/releases/latest`) do set VERSION=%%~nxV
curl -L -o rls-windows.zip "https://github.com/jaredly/reason-language-server/releases/download/%VERSION%/rls-windows.zip"
call "%~dp0\run_unzip.cmd" rls-windows.zip
del rls-windows.zip

move rls-windows\reason-language-server.exe reason-language-server.exe
rmdir rls-windows
