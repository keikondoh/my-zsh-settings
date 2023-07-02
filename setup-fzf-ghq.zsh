#! /bin/sh

function fzf-ghq() {
    local target=$(ghq list $1 | fzf --preview 'bat --color=always --style=header,grid --line-range=:80 $(ghq root)/{}/README.*')
    if [ -n "$target" ]; then
        printf "$(ghq root)/$target\n"
        return 0
    fi
    return 130
}

function gcd() {
    local target
    if target=$(fzf-ghq $1); then
        cd $target
        return 0
    fi
    return 130
}
