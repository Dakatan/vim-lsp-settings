#!/usr/bin/env bash

VERSION=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/borkdude/clj-kondo/releases/latest))
curl -L -o clj-kondo-lsp https://github.com/borkdude/clj-kondo/releases/download/v$VERSION/clj-kondo-lsp-server-$(echo VERSION | awk '{print substr($0, 2)}')-standalone.jar
