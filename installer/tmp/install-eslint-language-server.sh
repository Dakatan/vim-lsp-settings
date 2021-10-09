#!/usr/bin/env bash

set -e

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/microsoft/vscode-eslint/releases/latest))
url="https://github.com/microsoft/vscode-eslint/archive/refs/tags/release/$version.zip"
echo $url
asset="vscode-eslint.vsix"
curl -L "$url" -o "$asset"
unzip "$asset"
rm "$asset"

cat <<EOF >eslint-language-server
#!/usr/bin/env bash

DIR=\$(cd \$(dirname \$0); pwd)
node \$DIR/extension/server/out/eslintServer.js \$*
EOF

chmod +x eslint-language-server
