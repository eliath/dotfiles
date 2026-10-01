#!/usr/bin/env bash

# Linux setup
# last verified on Ubuntu 20.04
log_todo "Enable hidden files in Files>Show Hidden Files"

# ubuntu drivers
sudo ubuntu-drivers autoinstall

# apt packages
dotmsg "installing apt packages..."
sudo apt update
xargs -a "$DOTFILES/lib/apt-packages" sudo apt install -y

# Debian installs fd as fdfind. Symlink the upstream name into ~/.local/bin,
# which is on PATH, so FZF_DEFAULT_COMMAND finds it in non-interactive shells.
mkdir -p "$HOME/.local/bin"
if command -v fdfind >/dev/null && ! command -v fd >/dev/null; then
  ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi
