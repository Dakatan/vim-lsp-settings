@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/d-language-server/dls/releases/latest`) do set VERSION=%%~nxV
curl -L -o dls-%VERSION%.windows.x86_64.zip https://github.com/d-language-server/dls/releases/download/%VERSION%/dls-%VERSION%.windows.x86_64.zip"
call "%~dp0\run_unzip.cmd" dls-v%VERSION%.windows.x86_64.zip
del dls-v%VERSION%.windows.x86_64.zip
