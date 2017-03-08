#!/bin/bash
pushd "$(dirname "$0")" >> /dev/null
. common.sh

. bash.sh # Setup bash
. git.sh  # Setup git
. vim.sh  # Setup vim
. brew.sh # Setup homebrew

popd >> /dev/null
