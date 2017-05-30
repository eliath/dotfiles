DIR=$(dirname $BASH_SOURCE)

# Efficient bash history
HISTCONTROL=ignoreboth

# Set Editor to be vim
export EDITOR=vim

# Set AutoJump
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

# Start powerline
powerline-daemon -q
. `python -m site --user-site`/powerline/bindings/bash/powerline.sh

# Highlight syntax in less cmd
export LESSOPEN="| source-highlight -f esc-solarized \
  --style-file=esc-solarized.style -i %s -o STDOUT"
export LESS=' -R '

# Add pip packages to path
export PATH="/Users/eliath/Library/Python/2.7/bin:$PATH"

# Add torch
. "$HOME/torch/install/bin/torch-activate"

# Source other configs
source "$DIR/.aliases"
source "$DIR/.functions"
