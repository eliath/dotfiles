#!/bin/bash

brew install zsh zsh-completions

[ -f "$HOME/.zshenv" ] && rm "$HOME/.zshenv"
echo 'ZDOTDIR="$HOME/dotfiles/zsh"' >> "$HOME/.zshenv"

git clone --recursive https://github.com/sorin-ionescu/prezto.git \
  "$HOME/dotfiles/zsh/.zprezto"

DF_ZBP="`which zsh`"
echo '

~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

Add the following line to /etc/shells (requires sudo):'
echo "$DF_ZBP"
echo -e "\nThen, change shell for your user with the following command:"
echo " $ chsh -s $DF_ZBP"
