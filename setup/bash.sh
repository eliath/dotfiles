#!/bin/bash
. common.sh
pushd "$(dirname "$0")" >> /dev/null

echo ". $DOTFILES/shell/.profile" >> "$HOME/.bash_profile"

popd >> /dev/null
