#!/bin/sh

# Homebrew Script for OSX
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# dev tools
brew install autojump
brew install htop

