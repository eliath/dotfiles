#!/bin/bash
pushd "$(dirname "$0")" >> /dev/null

touch $HOME/.tmux.conf
echo "source-file $DOTFILES/tmux/config" >> $HOME/.tmux.conf

popd >> /dev/null
