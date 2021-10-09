@echo off

setlocal
for /f "usebackq" %%V in (`curl -Ls -o nul -w %{url_effective} https://github.com/clojure-lsp/clojure-lsp/releases/latest`) do set VERSION=%%~nxV
curl -L -o clojure-lsp.cmd https://github.com/clojure-lsp/clojure-lsp/releases/download/%VERSION%/clojure-lsp
