@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/latest`) do set VERSION=%%~nxV
curl -L -o EmmyLua-LS-all.jar "https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/download/%VERSION%/EmmyLua-LS-all.jar"

echo @echo off ^

java -cp %%~dp0/EmmyLua-LS-all.jar com.tang.vscode.MainKt ^

> emmylua-ls.cmd

