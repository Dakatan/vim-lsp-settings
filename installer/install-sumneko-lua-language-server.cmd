@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/sumneko/vscode-lua/releases/latest`) do set VERSION=%%~nxV
curl -L -o "vscode-lua.vsix" "https://github.com/sumneko/vscode-lua/releases/download/%VERSION%/lua-%VERSION:~1%.vsix"

call "%~dp0\run_unzip.cmd" vscode-lua.vsix
del vscode-lua.vsix

echo @echo off ^

%%~dp0\extension\server\bin\Windows\lua-language-server.exe -E -e LANG=en %%~dp0\extension\server\main.lua %%* ^

> sumneko-lua-language-server.cmd
