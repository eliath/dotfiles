# Install Homebrew for OSX
echo "DOTFILES] Installing homebrew and cask..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# bring up to speed
brew update
brew upgrade

# also tap caskroom
brew tap caskroom/cask

echo "DOTFILES] brew installation script complete."
