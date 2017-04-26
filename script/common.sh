DOTFILES="$HOME/dotfiles"
SCRIPT_DIR="$DOTFILES/script"
if hash brew 2>/dev/null; then
  :
else
  . $DOTFILES/script/install_brew.sh
fi
BREW_DIR=$(brew --prefix)
