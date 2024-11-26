# emc dotfiles

Not going to list instructions for mapping caps to esc, setting up desktop env, etc.

Setup an SSH key for the new computer, add the SSH key to github, and clone the repo into your home directory.

Once ready, use ./install

The script handles:

1. Install software packages like git, zsh, fzf ...
2. Install asdf package manager for things like python
3. System Configurations like ZDOTDIR and git configs
4. Plugin configurations such as prezto for zsh

At the end of the install the script will print further instructions. The script is
designed to work on both mac and linux from the same ./install entry point.
