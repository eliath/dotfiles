Setting up zsh
===============

Run the setup script.

From dotfiles root:

    $ ./zsh/setup.sh

This script handles:

1. Install zsh & zsh completions with homebrew
2. Set ZDOTDIR to be the one in ~/dotfiles
3. Clone prezto into ZDOTDIR
4. Echo instructions on how to change the user's shell


When you change the users' shell:

- `sudo vim /etc/shells`
- comment (`#`) the existing zsh definition if present
- add new zsh bin path
- `chsh -s` + new bin path

Restart your terminal and everything should work
