@echo off
setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/borkdude/clj-kondo/releases/latest`) do set VERSION=%%~nxV
curl -L -o clj-kondo-lsp https://github.com/borkdude/clj-kondo/releases/download/%VERSION%/clj-kondo-lsp-server-%VERSION:~1%-standalone.jar
