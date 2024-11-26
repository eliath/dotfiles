# Aliases
alias hgrep='history | grep'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias incognito=' unset HISTFILE'
# Functions
source "$ZDOTDIR/functions.zsh"

# Editors/pagers
export EDITOR='code --wait'
export VISUAL='code --wait'
export PAGER=less

if [[ "$(uname)" == "Darwin" ]]; then
  # less syntax highlight (source: https://gist.github.com/textarcana/4611277#gistcomment-1701305)
  export LESSOPEN="| $(which highlight) %s --out-format xterm256 --quiet --force --style solarized-light"
  alias less='less -m -n -g -i --underline-special'
  # ls colors
  unset LS_COLORS
  CLICOLOR=1
  CLICOLOR_FORCE=1
else # Linux
  # less syntax highlight
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
  # ls colors
  alias ls='ls --group-directories-first -F --color=auto'
fi
export LESS=" -R "

###########
# PATHS   #
###########

# A place for local binaries
export PATH="${HOME}/local/bin:${PATH}"

#####################
# ACTIVATE SOFTWARE #
#####################
if [[ "$(uname)" == "Darwin" ]]; then
  if [ -d "/opt/homebrew/bin" ]; then
    # Homebrew activation
    export PATH="/opt/homebrew/bin:$PATH"
    . "${ZDOTDIR}/brew-activate.zsh"
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  . "${ZDOTDIR}/apt-activate.zsh"
fi

# fzf
[ -f ${HOME}/.fzf.zsh ] && . ${HOME}/.fzf.zsh
. "${ZDOTDIR}/fzf_config.zsh"

# Python software via asdf
if asdf which python >/dev/null 2>&1; then
  asdf reshim python
fi

# asdf version manager
. ${HOME}/.asdf/asdf.sh
if (( ${+ASDF_DIR} )); then
  fpath=(${ASDF_DIR}/completions $fpath)
fi

# PREZTO #############################################
zstyle ':prezto:load' pmodule \
  'contrib-prompt' \
  'prompt' \
  'completion' \
  'directory' \
  'docker' \
  'environment' \
  'git' \
  'history' \
  'history-substring-search' \
  'homebrew' \
  'node' \
  'spectrum' \
  'ssh' \
  'syntax-highlighting' \
  'terminal' \
  'tmux' \
  'utility' \
  'command-not-found'

# activate Prezto
prezto_init=$ZDOTDIR/.zprezto/init.zsh
[[ -s $prezto_init ]] && . $prezto_init

# extra git alias not provided by prezto
alias gfb='git fb'
alias gwdn='git --no-pager diff --name-only'

# prezto settings
zstyle ':prezto:module:editor' key-bindings 'vi'
. $ZDOTDIR/spaceship.zsh

# de-dup fpath
fpath=(${(u)fpath[@]})

# Load local configs/overrides
local_profile="${HOME}/local/profile.zsh"
[[ -s $local_profile ]] && . $local_profile
