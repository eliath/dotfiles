#!/bin/bash
pushd "$(dirname "$0")" >> /dev/null
. common.sh

if [ ! -f ~/.gitconfig ]; then
  echo "[user]
  email = eliasmartinezcohen@gmail.com" > ~/.gitconfig
fi
echo "[include]
  path = $DOTFILES/git/config" | \
  cat - ~/.gitconfig > /tmp/gitconfig && \
  mv /tmp/gitconfig ~/.gitconfig
popd >> /dev/null
