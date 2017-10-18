DOTFILES=$HOME/dotfiles
SRC=$DOTFILES/powerline
DEST=$HOME/.config/powerline
rm "$DEST"
ln -s "$SRC" "$DEST"
powerline-daemon --replace
