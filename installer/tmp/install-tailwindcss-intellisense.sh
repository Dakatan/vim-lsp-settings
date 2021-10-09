#!/usr/bin/env bash

set -e

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/tailwindlabs/tailwindcss-intellisense/releases/latest))
url="https://github.com/tailwindlabs/tailwindcss-intellisense/releases/download/$version/vscode-tailwindcss-$(echo $version | awk '{print substr($0, 2)}').vsix"
asset="vscode-tailwindcss.vsix"

curl -L "$url" -o "$asset"
unzip "$asset"
rm "$asset" \[Content_Types\].xml extension.vsixmanifest


chmod +x extension/dist/server/index.js

cat <<EOF >tailwindcss-intellisense
#!/usr/bin/env bash

DIR=\$(cd \$(dirname \$0); pwd)
node \$DIR/extension/dist/server/index.js \$*
EOF

chmod +x tailwindcss-intellisense
