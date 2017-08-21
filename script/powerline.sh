. $HOME/dotfiles/script/lazy_init.sh

if brew ls --versions python > /dev/null; then
  echo "\n[DOTFILES] Installing powerline dependency: python"
  brew install python
fi

pip install --user powerline-status
pip install --user powerline-gitstatus
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/powerline" "$HOME/.config/powerline"

cp $DOTFILES/lib/Menlo-for-Powerline/*.ttf ~/Library/Fonts/
