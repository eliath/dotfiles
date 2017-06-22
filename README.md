. f i l e s
===========

Installation
------------

1. Clone this repo: `git clone --recursive github.com/eliath/dotfiles.git ~/dotfiles`
    a. This will prompt to install dev tools, if it doesn't prompt,
       install them anyway: `xcode-select --install`
    b. if you didn't install submodules when you cloned do it now:
       `git submodule update --init --recursive`
2. While that does its thing, configure basic prefs, e.g. dock apps,
   background,  menubar, timezone,  etc.
3. Some App Store stuff:
    a. 1password
    b. Newton
    b. Fantastical
    c. BreakTime
6. More necessary apps:
    a. Iris: http://iristech.co

Everything else should be taken care of by the setup script:

    $ ~/dotfiles/install.sh



run `./script/setup.sh all` to setup everything

run the script with no arguments to see a list of available targets.

Additional Setup
----------------

- alfred
  - most preferences should sync, but you may need to update theme
- iterm
  - General > Load Preferences From Folder > dotfiles/iTerm

-------

References:

- https://dotfiles.github.io/
- https://github.com/ptsteadman/dotfiles
- https://github.com/nicksp/dotfiles
