#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

. ../scripts/functions.sh

CONFIG_SRC="$(realpath .)"
CONFIG_DST="$(realpath ~/bin)"
HOME="$(realpath ~/)"

info "Configuring custom binaries..."
mkdir -p "$CONFIG_DST"

find . -type f | while read fn; do
    if [ $fn != "./setup.sh" ]; then
       echo "$fn"
       symlink "$CONFIG_SRC/$fn" "$CONFIG_DST/$fn"
    fi
done
clear_broken_symlinks "$CONFIG_DST"

success "Finished configuring custom binaries."
