#!/usr/bin/env zsh

# Linux setup
# verified on Ubuntu 20.04
log_todo "Enable hidden files in Files>Show Hidden Files"

# apt packages
dotmsg "installing apt packages..."
sudo apt update
xargs -a ${DOTFILES}/lib/apt-packages sudo apt install -y
