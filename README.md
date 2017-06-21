# dotfiles baby!

# Setup

## New Computer

1. Configure basic prefs, e.g. dock apps, background,  menubar, timezone,  etc.
2. Download 1Password
3. Install Xcode Dev Tools
4. App Store
   a. Newton
   b. Fantastical
5. Install brew, cask, and other apps w/ ./script/brew.sh
6. Iris: iristech.co

run `./script/setup.sh all` to setup everything
run the script with no arguments to see a list of available targets.
you also might need to install xcode tools before doing any of this shit:

    xcode-select --install

# App Setup

- alfred
- iterm
  - General > Load Preferences From Folder > dotfiles/iTerm
  - Color scheme?
  - powerline
    - install menlo for powerline https://github.com/abertsch/Menlo-for-Powerline
    - powerline should be linked in setup script
- vim
  - .vim and .vimrc should be linked with the setup script
  - run vim and do :PlugInstall
  - YouCompleteMe:
    - follow the instructions at https://valloric.github.io/YouCompleteMe/#full-installation-guide
    - also don't forget to do `./install.py --tern-completer` or whatever.
- tmux
  - .tmux and .tmuxrc should be linked with the setup script
  - install plugins or whatever?
- install lua from http://luadist.org/ if you need it.

-------

References:

- https://dotfiles.github.io/
- https://github.com/ptsteadman/dotfiles
- https://github.com/nicksp/dotfiles
