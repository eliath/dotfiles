. $HOME/dotfiles/script/lazy_init.sh

PIP_REQUIRE_VIRTUALENV="" pip3 install powerline-status
PIP_REQUIRE_VIRTUALENV="" pip3 install powerline-gitstatus
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/powerline" "$HOME/.config/powerline"
