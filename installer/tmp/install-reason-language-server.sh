#!/usr/bin/env bash

set -e

os=$(uname -s | tr "[:upper:]" "[:lower:]")

case $os in
linux) ;;
darwin)
  os="macos"
  ;;
*)
  printf "%s doesn't supported by bash installer" "$os"
  exit 1
  ;;
esac

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/jaredly/reason-language-server/releases/latest))
url="https://github.com/jaredly/reason-language-server/releases/download/$version/rls-$os.zip"
curl -LO "$url"
unzip "rls-$os.zip"

ln -s "./rls-$os/reason-language-server" .
