. lazy_init.sh

brew update
brew upgrade

# dev tools
brew install vim --with-override-system-vi
brew install python
brew install tmux
brew install autojump
brew install htop
brew install source-highlight
brew install ghi

# cask apps
brew tap caskroom/cask
brew cask install google-chrome
brew cask install 1password
brew cask install alfred
brew cask install iterm2
brew cask install spectacle
brew cask install karabiner-elements
brew cask install sketch
brew cask install rescuetime
