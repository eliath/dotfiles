#!/usr/bin/env zsh

# Linux setup
# last verified on Ubuntu 20.04
log_todo "Enable hidden files in Files>Show Hidden Files"

# ubuntu drivers
sudo ubuntu-drivers autoinstall

# apt packages
dotmsg "installing apt packages..."
sudo apt update
xargs -a ${DOTFILES}/lib/apt-packages sudo apt install -y

# asdf install
dotmsg "installing latest asdf release..."
$DOTFILES/lib/download-asdf-linux.zsh
