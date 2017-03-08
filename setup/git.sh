#!/bin/bash
. common.sh

if [ ! -f ~/.gitconfig ]; then
  echo "[user]
  email = eliasmartinezcohen@gmail.com" > ~/.gitconfig
fi
echo "[include]
  path = $DOTFILES/git/config" | \
  cat - ~/.gitconfig > /tmp/gitconfig && \
  mv /tmp/gitconfig ~/.gitconfig

git config --global credential.helper osxkeychain
