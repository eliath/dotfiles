#!/bin/bash
[ -f "$HOME/.zshenv" ] && rm "$HOME/.zshenv"
echo 'ZDOTDIR="$HOME/dotfiles/zsh"' >> "$HOME/.zshenv"

git clone --recursive https://github.com/sorin-ionescu/prezto.git \
  "$HOME/dotfiles/zsh/.zprezto"

echo -e "Add the following line to /etc/shells (requires sudo):"
echo "`which zsh`"
echo "Then run sudo \"chsh -s `which zsh`\""