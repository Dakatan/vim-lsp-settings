#!/usr/bin/env bash

set -e

os=$(uname -s | tr "[:upper:]" "[:lower:]")
version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/juliosueiras/terraform-lsp/releases/latest))

case $os in
darwin | linux)
  url="https://github.com/juliosueiras/terraform-lsp/releases/download/${version}/terraform-lsp_$(echo $version | awk '{print substr($0, 2)}')_${os}_amd64.tar.gz"
  curl -L "$url" | tar zx
  ;;
*)
  printf "%s doesn't supported" "$os"
  exit 1
  ;;

esac
