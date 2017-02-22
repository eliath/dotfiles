#!/bin/bash
DOTFILES="$HOME/dotfiles"
BREW_DIR=$(brew --prefix)

# Setup Bash
echo ". $DOTFILES/shell/.profile" >> "$HOME/.bash_profile"

# Setup vim
ln -s "$DOTFILES/vim/.vim" "$HOME/.vim"
ln -s "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

