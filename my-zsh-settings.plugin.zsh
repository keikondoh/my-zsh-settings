#! /bin/zsh

function __is_enabled() {
    if printf '%s\n' "${ENABLEDAPP[@]}" | grep -qx $1; then
        echo 1
    else
        echo 0
    fi
}

# カレントディレクトリを移動
local orgpwd=$(pwd)
cd $(dirname $0)

# 環境変数 ENABLEDAPP が設定していなければすべてのアプリが入っている前提になる
if [ -z "$ENABLEDAPP" ]; then
    ENABLEDAPP=("fzf" "exa" "ghq" "docker")
fi

if [ $(__is_enabled "docker") -eq 1 ]; then
    source setup-docker.zsh
fi

if [ $(__is_enabled "exa") -eq 1 ]; then
    source setup-exa.zsh
fi

if [ $(__is_enabled "fzf") -eq 1 ] && [ $(__is_enabled "ghq") -eq 1 ]; then
    source setup-fzf-ghq.zsh
fi

# カレントディレクトリを復帰
cd $orgpwd
