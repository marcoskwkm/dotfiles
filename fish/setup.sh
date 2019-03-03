#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR"

CONFIG_SRC="$(realpath .)"
CONFIG_DST="$(realpath ~/.config/fish)"

. ../scripts/functions.sh

sudo -v
set_fish_shell() {
    info "Setting up fish..."
    if grep --quiet fish <<< "$SHELL"; then
        success "fish shell is already set up."
    else
        substep_info "Adding fish executable to /etc/shells..."
        if grep --fixed-strings --line-regexp --quiet "/usr/bin/fish" /etc/shells; then
            substep_success "Fish executable already exists in /etc/shells."
        else
            if sudo bash -c "echo /usr/bin/bash >> /etc/shells"; then
                substep_success "Fish executable added to /etc/shells."
            else
                substep_error "Failed adding fish executable to /etc/shells."
                return 1
            fi
        fi
        substep_info "Changing shell to fish..."
        if chsh -s /usr/bin/fish; then
            substep_success "Successfully changed shell to fish."
        else
            substep_error "Failed changing shell to fish."
            return 2
        fi
        substep_info "Running fish initial setup..."
        fish -c "setup"
    fi
}

if set_fish_shell; then
    success "Successfully set up fish shell."
else
    error "Failed setting up fish shell."
fi

info "Creating fish config folders..."
mkdir -p "$CONFIG_DST/functions"
find * -name "*.fish" -o -name "fishfile" | while read fn; do
    symlink "$CONFIG_SRC/$fn" "$CONFIG_DST/$fn"
done
clear_broken_symlinks "$CONFIG_DST"

success "Fish setup complete."
