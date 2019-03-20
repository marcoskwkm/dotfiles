#!/bin/bash

case $(uname -s) in
    Linux*)  echo "Setting up for Linux..."; ENV="Linux";;
    Darwin*) echo "Setting up for MacOS..."; ENV="Mac";;
    *)       echo "Error: Unknown OS"; exit 1
esac

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

info "Prompting for sudo password..."
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

# Package control must be executed first in order for the rest to work
./packages/$ENV/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

success "Finished installing Dotfiles"
