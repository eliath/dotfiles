dotfiles baby!
===============

Setup
-----

## New Computer

1. Clone this repo: `git clone github.com/eliath/dotfiles.git`
    a. This will prompt to install dev tools, if it doesn't prompt,
       install them anyway: `xcode-select --install`
2. While that does its thing, configure basic prefs, e.g. dock apps,
   background,  menubar, timezone,  etc.
3. Download 1Password and log in before you're prompted for a million passwords.
4. Some App Store stuff:
    a. Newton
    b. Fantastical
    c. BreakTime
6. More necessary apps:
    a. Iris: iristech.co

Everything else should be taken care of by the setup scripts.

## Setup scripts

Now you are ready to run the setups.

run `./script/setup.sh all` to setup everything

run the script with no arguments to see a list of available targets.

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
