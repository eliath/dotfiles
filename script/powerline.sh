. $HOME/dotfiles/script/lazy_init.sh

if brew ls --versions python > /dev/null; then
  echo "\n[DOTFILES] Installing powerline dependency: python"
  brew install python
fi

gpip install powerline-status
gpip install powerline-gitstatus
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/powerline" "$HOME/.config/powerline"
