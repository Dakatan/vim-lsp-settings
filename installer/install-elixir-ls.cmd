@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/elixir-lsp/elixir-ls/releases/latest`) do set VERSION=%%~nxV
curl -L -o elixir-ls.zip "https://github.com/elixir-lsp/elixir-ls/releases/download/%VERSION%/elixir-ls.zip"
call "%~dp0\run_unzip.cmd" elixir-ls.zip
del elixir-ls.zip

echo @echo off ^

call language_server.bat ^

> elixir-ls.cmd

