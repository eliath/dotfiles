# Aliases
alias ll="ls -lG"
alias la="ls -laG"
alias git=hub
alias hgrep='history | grep'
alias ps='ps aux'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'

# Editors
export EDITOR='vim'
export VISUAL='vim'

# History options
setopt BANG_HIST
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

###########
# PATHS   #
###########
# pip packages
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# yarn packages
# export PATH="$(yarn global bin):$PATH"

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
  'node' \
  'syntax-highlighting' \
  'history-substring-search'

# Activate Prezto
PREZTO_INIT="$ZDOTDIR/.zprezto/init.zsh"
[ -f "$PREZTO_INIT" ] && source "$PREZTO_INIT"
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# powerline
powerline-daemon -q
. `python -m site --user-site`/powerline/bindings/zsh/powerline.zsh

# Start TMUX on login
if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || exec tmux new-session && exit)
fi
:
