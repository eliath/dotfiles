#!/usr/bin/env bash

# macOS setup

# screenshots go to the clipboard, like Cmd+Shift+5 > Options > Save to > Clipboard.
# Hold Ctrl with any screenshot shortcut to force the clipboard regardless.
defaults write com.apple.screencapture target clipboard
killall SystemUIServer || true
dotmsg "screenshots will copy to the clipboard"

# show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
log_todo "you may need to \`killall Finder\` to show hidden files"

# Dock: auto-hide, and keep recent apps out of an otherwise empty Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# Dock: remove all pinned apps. Finder and Trash aren't in this list, so they
# stay. Runs on the first install only, so re-running install won't remove
# apps pinned since.
dock_marker="$HOME/.local/state/dotfiles/dock-cleared"
if [[ ! -f "$dock_marker" ]]; then
  defaults write com.apple.dock persistent-apps -array
  mkdir -p "$(dirname "$dock_marker")"
  touch "$dock_marker"
fi

# killall fails when no Dock is running, e.g. over SSH without a GUI login
killall Dock || true

# homebrew
if ! command -v brew >/dev/null; then
  dotmsg "installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
dotmsg "updating homebrew..."
brew update
# Homebrew requires third-party taps to be trusted before they can be tapped
brew trust --tap abue-ammar/tinycast
dotmsg "installing homebrew packages..."
brew bundle --file "$DOTFILES/lib/Brewfile"
