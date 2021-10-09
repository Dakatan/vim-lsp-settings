@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/microsoft/vscode-eslint/releases/latest`) do set VERSION=%%~nxV
curl -L -o "vscode-eslint.vsix" "https://github.com/microsoft/vscode-eslint/releases/download/release%%2F%VERSION%-next.1/vscode-eslint-%VERSION%.vsix"
call "%~dp0\run_unzip.cmd" vscode-eslint.vsix
del vscode-eslint.vsix

echo @echo off ^

node %%~dp0\extension\server\out\eslintServer.js %%* ^

> eslint-language-server.cmd

