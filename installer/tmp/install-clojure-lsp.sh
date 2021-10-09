#!/usr/bin/env bash

set -e

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/clojure-lsp/clojure-lsp/releases/latest))
curl -L -o clojure-lsp "https://github.com/clojure-lsp/clojure-lsp/releases/download/$version/clojure-lsp"
chmod +x clojure-lsp
