. common.sh

# Homebrew Script for OSX
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# dev tools
brew install vim --with-override-system-vi
brew install tmux
brew install autojump
brew install htop

# cask
brew tap caskroom/cask
brew cask install google-chrome
brew cask install alfred
brew cask install spectacle
brew cask install iterm2
