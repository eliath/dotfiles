# Aliases
alias hgrep='history | grep'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
# Functions
source "$ZDOTDIR/functions.zsh"

# Editors/pagers
export EDITOR=vim
export VISUAL=vim
export PAGER=less

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Less highlighting
# source: https://gist.github.com/textarcana/4611277#gistcomment-1701305
# Setup: "brew install highlight"
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --quiet --force --style solarized-light"
export LESS=" -R"
alias less='less -m -n -g -i --underline-special'

###########
# PATHS   #
###########

# A place for local binaries
export PATH="$HOME/local/bin:$PATH"

#####################
# ACTIVATE SOFTWARE #
#####################
brew_prefix=`brew --prefix`

# autojump
[[ -s $brew_prefix/etc/autojump.sh ]] && . $brew_prefix/etc/autojump.sh

# fzf
[ -f ${HOME}/.fzf.zsh ] && . ${HOME}/.fzf.zsh
. "${ZDOTDIR}/fzf_config.zsh"

# asdf version manager
. ${HOME}/.asdf/asdf.sh

# Python software via asdf
if asdf which python >/dev/null 2>&1; then
  asdf reshim python
fi

# PREZTO #############################################
zstyle ':prezto:load' pmodule \
  'contrib-prompt' \
  'prompt' \
  'completion' \
  'directory' \
  'docker' \
  'editor' \
  'environment' \
  'git' \
  'history' \
  'history-substring-search' \
  'homebrew' \
  'node' \
  'osx' \
  'spectrum' \
  'syntax-highlighting' \
  'terminal' \
  'tmux' \
  'utility'

# activate Prezto
prezto_init=$ZDOTDIR/.zprezto/init.zsh
[[ -s $prezto_init ]] && . $prezto_init

# prezto settings
zstyle ':prezto:module:editor' key-bindings 'vi'
. $ZDOTDIR/spaceship.zsh

# homebrew completions
if type brew &>/dev/null; then
  FPATH=$brew_prefix/share/zsh/site-functions:$FPATH
fi

# Load local configs/overrides
local_profile="${HOME}/local/profile.zsh"
if [[ -s $local_profile ]]; then
  source $local_profile
fi
