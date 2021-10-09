@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/juliosueiras/terraform-lsp/releases/latest`) do set VERSION=%%~nxV
curl -L "https://github.com/juliosueiras/terraform-lsp/releases/download/%VERSION%/terraform-lsp_%VERSION:~1%_windows_amd64.tar.gz" | tar xz
