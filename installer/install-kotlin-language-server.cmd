@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/fwcd/kotlin-language-server/releases/latest`) do set VERSION=%%~nxV
curl -L -o server.zip "https://github.com/fwcd/kotlin-language-server/releases/download/%VERSION%/server.zip"
call "%~dp0\run_unzip.cmd" server.zip
del server.zip

echo @echo off ^

call %%~dp0\server\bin\kotlin-language-server.bat %%* ^

> kotlin-language-server.cmd

