#!/bin/bash
pushd "$(dirname "$0")" >> /dev/null

ln -s "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

popd >> /dev/null
