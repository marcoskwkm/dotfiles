#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

sudo -v

info "Installing APT packages..."
while read package; do
    if [[ $package == $COMMENT ]];
    then continue
    fi
    substep_info "Installing $package..."
    sudo apt-get -qq install $package
done < "apt-get.list"
success "Finished installing APT packages."
