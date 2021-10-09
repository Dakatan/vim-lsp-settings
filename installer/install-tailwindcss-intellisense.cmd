@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/tailwindlabs/tailwindcss-intellisense/releases/latest`) do set VERSION=%%~nxV
curl -L -o "vscode-tailwindcss.vsix" "https://github.com/tailwindlabs/tailwindcss-intellisense/releases/download/%VERSION%/vscode-tailwindcss-%VERSION:~1%.vsix"

call "%~dp0\run_unzip.cmd" vscode-tailwindcss.vsix
rem del vscode-tailwindcss.vsix

echo @echo off ^

node %%~dp0\extension\dist\server\index.js %%* ^

> tailwindcss-intellisense.cmd
