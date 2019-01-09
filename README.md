. f i l e s
===========

Installation
------------

1. Clone this repo: `git clone --recursive https://github.com/eliath/dotfiles.git ~/dotfiles`

    a. This will prompt to install dev tools, if it doesn't prompt,
       install them anyway: `xcode-select --install`

    b. if you didn't install submodules when you cloned do it now:
      `git submodule update --init --recursive`

2. While that does its thing, configure basic prefs, e.g. dock apps,
   background,  menubar, timezone,  etc.
   
   a. Background image, remove all dock apps, change select color, mouse tracking speed...
   
   b. Optionally set the computer name with `scutil`

   c. Change the spotlight keyboard shortcuts in System Prefs, and de-activate all
      mission control shortcuts.

3. Some App Store stuff:

   a. 1password

   b. spectacles

   c. amphetamine

Everything else should be taken care of by the setup script:

    $ ~/dotfiles/install.sh all

The `all` target will run all setup scripts. Run without argument to see a list of
available targets


Additional Setup
----------------

- alfred
  - most preferences should sync, but you may need to update theme
- iterm
  - General > Load Preferences From Folder > dotfiles/iTerm
- Load humble tab settings in chrome: `~/dotfiles/chrome/humble-tab-settings.json`

