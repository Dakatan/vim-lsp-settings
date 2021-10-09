#!/usr/bin/env bash

set -e

os=$(uname -s | tr "[:upper:]" "[:lower:]")

case $os in
linux) ;;
darwin)
  os="osx"
  ;;
*)
  echo "$os is not supported by installer"
  exit 1
  ;;
esac

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/Pure-D/serve-d/releases/latest))
filename="serve-d_$(echo $version | awk '{print substr($0, 2)}')-$os-x86_64.tar.xz"
url="https://github.com/Pure-D/serve-d/releases/download/$version/$filename"
curl -L "$url" | unxz | tar x
