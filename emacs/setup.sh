#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

. ../scripts/functions.sh

CONFIG_SRC="$(realpath .)"
CONFIG_DST="$(realpath ~/.emacs.d)"

info "Configuring emacs..."
mkdir -p "$CONFIG_DST"
mkdir -p "$CONFIG_DST/config"

symlink "$CONFIG_SRC/.clang-format" "$(realpath ~/.clang-format)"

find . -name "*.el" | while read fn; do
    symlink "$CONFIG_SRC/$fn" "$CONFIG_DST/$fn"
done
clear_broken_symlinks "$CONFIG_DST"

success "Finished configuring emacs."
