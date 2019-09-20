#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"
CONFIG_DST="$(realpath ~/Library/Application\ Support/iTerm2/)"

info "Setting up iTerm2..."

# Load custom preferences from this folder
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$SOURCE"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

find . -name "*.py" | while read fn; do
    symlink "$SOURCE/$fn" "$CONFIG_DST/$fn"
done
clear_broken_symlinks "$CONFIG_DST"

success "Successfully set up iTerm2."
