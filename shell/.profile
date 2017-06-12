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
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Add yarn packages to path
export PATH="$(yarn global bin):$PATH"

# Add torch
. "$HOME/torch/install/bin/torch-activate"
export PATH="$HOME/torch/install/bin:$PATH"

# A place for local binaries
export PATH="$HOME/local/bin:$PATH"

# Source other configs
source "$DIR/.aliases"
source "$DIR/.functions"
