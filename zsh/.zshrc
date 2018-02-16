# Aliases
alias git=hub
alias ll='ls -lG'
alias la='ls -laG'
alias hgrep='history | grep'
alias ps='ps aux'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'

# Editors
export EDITOR='vim'
export VISUAL='vim'


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
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


############
# PREZTO   #
############
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'git' \
  'syntax-highlighting' \
  'history-substring-search'

# Activate Prezto
PREZTO_INIT="$ZDOTDIR/.zprezto/init.zsh"
[ -f "$PREZTO_INIT" ] && source "$PREZTO_INIT"

# powerline
powerline-daemon -q
. `python -m site --user-site`/powerline/bindings/zsh/powerline.zsh

# Start TMUX on login
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux new-session && exit)
fi
:
