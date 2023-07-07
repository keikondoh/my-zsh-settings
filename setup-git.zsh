#! /bin/sh

function pcd() {
    local target
    if target=$(git rev-parse --show-toplevel); then
        cd $target
        return 0
    fi
    return 130
}
