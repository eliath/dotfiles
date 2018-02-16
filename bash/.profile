DIR=$(dirname $BASH_SOURCE)

#####################
# CONFIG            #
#####################
HISTCONTROL=ignoreboth # Efficient bash history
export EDITOR=vim
export LESS=' -R ' # Highlight syntax in less
export LESSOPEN="| source-highlight -f esc-solarized \
  --style-file=esc-solarized.style -i %s -o STDOUT"


###########
# PATHS   #
###########
# pip packages
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# yarn packages
export PATH="$(yarn global bin):$PATH"

# torch packages
export PATH="$HOME/torch/install/bin:$PATH"

# A place for local binaries
export PATH="$HOME/local/bin:$PATH"


#####################
# ACTIVATE SOFTWARE #
#####################
# torch
. "$HOME/torch/install/bin/torch-activate"

# autojump
[[ -s `brew --prefix`/etc/autojump.sh  ]] && . `brew --prefix`/etc/autojump.sh

# powerline
powerline-daemon -q
. `python -m site --user-site`/powerline/bindings/bash/powerline.sh

#####################
# ADD'L CONFIGS    #
#####################
source "$DIR/.aliases"
source "$DIR/.functions"


# Start Tmux on Login
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi
