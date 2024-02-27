#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

. ../scripts/functions.sh

CONFIG_SRC="$(realpath .)"
CONFIG_DST="$(realpath ~/.emacs.d)"
HOME="$(realpath ~/)"

info "Configuring emacs..."
mkdir -p "$CONFIG_DST"
mkdir -p "$CONFIG_DST/config"

symlink "$CONFIG_SRC/.clang-format" "$HOME/.clang-format"

find . -name "*.el" | while read fn; do
    symlink "$CONFIG_SRC/$fn" "$CONFIG_DST/$fn"
done
clear_broken_symlinks "$CONFIG_DST"

if [ ! -d "$CONFIG_DST/unity" ]; then
    cd "$CONFIG_DST"
    git clone git@github.com:elizagamedev/unity.el unity
fi
if [ ! -d "$CONFIG_DST/copilot" ]; then
    cd "$CONFIG_DST"
    git clone git@github.com:copilot-emacs/copilot.el copilot
fi

success "Finished configuring emacs."
