#!/bin/bash

DIR=$(dirname $0)
cd "$DIR"

. ../scripts/functions.sh

CONFIG_SRC="$(realpath .)"
HOME="$(realpath ~/)"
EXTENSIONS=(
    "amazonwebservices.codewhisperer-for-command-line-companion"
    "azemoh.one-monokai"
    "bradlc.vscode-tailwindcss"
    "dbaeumer.vscode-eslint"
    "eamodio.gitlens"
    "esbenp.prettier-vscode"
    "github.copilot"
    "github.copilot-chat"
    "graphql.vscode-graphql"
    "graphql.vscode-graphql-syntax"
    "ms-playwright.playwright"
    "prisma.prisma"
    "qwtel.sqlite-viewer"
    "sakapoko.vscode-emacs-indent"
    "vscodeemacs.emacs"
)

info "Configuring VSCode..."

info "Creating symlink for keybindings.json..."

symlink "$CONFIG_SRC/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

info "Installing extensions..."
for ext in "${EXTENSIONS[@]}"; do
    code --install-extension $ext
done

success "Finished configuring VSCode."
