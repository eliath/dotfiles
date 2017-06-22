if [ "$DOTFILES_LAZY_INIT" = true ]; then
 return
fi

. "$HOME/dotfiles/script/variables.sh"

if hash brew 2>/dev/null; then
  :
else
  echo "\n[DOTFILES] Installing Homebrew and Cask ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade
  brew tap caskroom/cask
  echo "\n[DOTFILES] Brew + Cask installed.\n"
fi
BREW_DIR=$(brew --prefix)

export DOTFILES_LAZY_INIT=true
