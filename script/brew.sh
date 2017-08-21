. $HOME/dotfiles/script/lazy_init.sh

brew update
brew upgrade

# dev tools
brew install vim --with-override-system-vi
brew install python
brew install tmux
brew install autojump
brew install htop
brew install ghi
brew install source-highlight
brew install the_silver_searcher

# cask apps
brew tap caskroom/cask
brew cask install google-chrome
brew cask install iterm2
brew cask install sublime-text
brew cask install alfred
brew cask install spectacle
brew cask install karabiner-elements
brew cask install iris
brew cask install sketch
brew cask install rescuetime
brew cask install torbrowser

# Additional Setup
SRC_HIGHLIGHT_DIR="$(brew --prefix source-highlight)/share/source-highlight"
OUTLANG_MAP="$SRC_HIGHLIGHT_DIR/outlang.map"
OUTLANG_MAP_ADDITION="esc-solarized = esc-solarized.outlang"
if grep -Fxq "$OUTLANG_MAP_ADDITION" "$OUTLANG_MAP"; then
  echo "[DOTFILES] source highlight already configured with solarized colorscheme"
else
  echo "[DOTFILES] adding solarized colorscheme to source-highlight config"
  echo $OUTLANG_MAP_ADDITION >> $OUTLANG_MAP
fi
cp $DOTFILES/lib/source-highlight-solarized/esc-solarized.* "$SRC_HIGHLIGHT_DIR/"
