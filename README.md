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

    a. Background image, remove all dock apps, change select color, mouse tracking speed...

    b. Set the computer name with:

    `sudo scutil --set HostName <hostname>.eliath.biz`

    `sudo scutil --set LocalHostName <hostname>`

    `sudo scutil --set ComputerName <hostname>`

    `dscacheutil -flushcache`

3. Some App Store stuff:

    a. 1password

    b. Newton

    c. Fantastical

    d. BreakTime

    e. Amphetamine

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
- powerline
  - The default iTunes segment is broken. Go to dotfiles/powerline/segments.py and
    follow the instructions at the top of the file, replacting the default iTunes
    segment with the contents of that file.
- chrome should pretty much set itself up.
  - load the "humble tab" settings from ~/dotfiles/chrome/humble-tab-settings.json

-------

References:

- https://dotfiles.github.io/
- https://github.com/ptsteadman/dotfiles
- https://github.com/nicksp/dotfiles
