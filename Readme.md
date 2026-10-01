# emc dotfiles

Not going to list instructions for mapping caps to esc, setting up desktop env, etc.

Setup an SSH key for the new computer, add the SSH key to github, and clone the repo into your home directory.

The install script runs in bash, which macOS and Ubuntu both ship. It installs zsh on Linux; macOS already has it.

Install [Ghostty](https://ghostty.org) and the [Input Mono](https://input.djr.com) font by hand first. The install script links the Ghostty config into place but installs neither. The font is not in this repo because its license forbids redistribution.

Once ready, use `./install`

The script handles:

1. Install software packages like git, zsh, fzf ...
2. Install mise package manager for things like python, node, go
3. System Configurations like ZDOTDIR, git and Ghostty configs
4. Plugin configurations such as prezto for zsh

At the end of the install the script will print further instructions. The script is
designed to work on both mac and linux from the same ./install entry point.
