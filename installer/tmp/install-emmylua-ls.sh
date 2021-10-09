#!/usr/bin/env bash

set -e

version=$(basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/latest))
curl -L -o EmmyLua-LS-all.jar "https://github.com/EmmyLua/EmmyLua-LanguageServer/releases/download/$version/EmmyLua-LS-all.jar"

cat <<EOF >emmylua-ls
#!/usr/bin/env bash

DIR=\$(cd \$(dirname \$0); pwd)
java -cp \$DIR/EmmyLua-LS-all.jar com.tang.vscode.MainKt
EOF

chmod +x emmylua-ls
