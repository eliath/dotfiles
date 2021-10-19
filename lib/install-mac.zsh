#!/usr/bin/env zsh

# macOS setup

# screenshot location
defaults write com.apple.screencapture location /tmp/

# show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
log_todo "you may need to \`killall Finder\` to show hidden files"

# homebrew
if ! hash brew > /dev/null; then
  dotmsg "installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
dotmsg "updating homebrew..."
brew update
dotmsg "installing homebrew packages..."
brew bundle --file $DOTFILES/lib/Brewfile

# install fzf
if brew list fzf >/dev/null; then
  $(brew --prefix)/opt/fzf/install --key-bindings --completion \
    --no-bash --no-zsh --no-fish
fi
