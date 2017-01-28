DIR=$(dirname $BASH_SOURCE)

# Set Editor to be vim
export EDITOR=vim

# Set AutoJump
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

# Start powerline
powerline-daemon -q
. `python -m site --user-site`/powerline/bindings/bash/powerline.sh

# Source other configs
source "$DIR/.aliases"
source "$DIR/.functions"
