. lazy_init.sh

BASH_PROFILE="$HOME/.bash_profile"
LINE_TO_ADD=". $DOTFILES/shell/.profile"

touch "$BASH_PROFILE"
if grep -Fxq "$LINE_TO_ADD" "$BASH_PROFILE"
then
  echo "\n[DOTFILES] dotfiles' bash .profile already added system .bash_profile, will not add it again."
else
  echo "\n[DOTFILES] adding .profile to system .bash_profile"
  echo ". $DOTFILES/bash/.profile" >> "$HOME/.bash_profile"
fi
