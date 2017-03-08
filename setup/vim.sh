#!/bin/bash
. common.sh
pushd "$(dirname "$0")" >> /dev/null

ln -s "$DOTFILES/vim/.vim" "$HOME/.vim"
ln -s "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

popd >> /dev/null
