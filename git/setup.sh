#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

. ../scripts/functions.sh

CONFIG_SRC="$(realpath .)"
CONFIG_DST="$(realpath ~)"

info "Configuring git..."

find . -name ".git*" | while read fn; do
    fn=$(basename $fn)
    symlink "$CONFIG_SRC/$fn" "$CONFIG_DST/$fn"
done

success "Finished configuring git."
