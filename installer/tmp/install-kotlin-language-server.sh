#!/usr/bin/env bash

set -e

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/fwcd/kotlin-language-server/releases/latest))
curl -L -o server.zip "https://github.com/fwcd/kotlin-language-server/releases/download/$version/server.zip"
unzip server.zip
rm server.zip

ln -s server/bin/kotlin-language-server .
