# Aliases
alias hgrep='history | grep'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias clr='clear'

# Functions
source "$ZDOTDIR/functions.zsh"

# Editors
export EDITOR='vim'
export VISUAL='vim'

###########
# PATHS   #
###########

# tmp
export TMPDIR="/private/tmp"

# A place for local binaries
export PATH="$HOME/local/bin:$PATH"

#####################
# ACTIVATE SOFTWARE #
#####################

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# fzf
source "${ZDOTDIR}/fzf_config.zsh"

# use python3 as python by adding homebrew aliases to $PATH
# NOTE: system python2 available at /usr/bin/python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# virtualenv (python)
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true
# create commands to override pip restrictions
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

############
# PREZTO   #
############
zstyle ':prezto:load' pmodule \
  'osx' \
  'environment' \
  'terminal' \
  'history' \
  'editor' \
  'directory' \
  'homebrew' \
  'spectrum' \
  'utility' \
  'completion' \
  'git' \
  'node' \
  'python' \
  'tmux' \
  'syntax-highlighting' \
  'history-substring-search' \
  'docker'

# Activate Prezto
PREZTO_INIT="$ZDOTDIR/.zprezto/init.zsh"
[ -f "$PREZTO_INIT" ] && source "$PREZTO_INIT"
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Completions w/ Homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi


# vim editor bindings
zstyle ':prezto:module:editor' key-bindings 'vi'

# powerline
PY3_SITE_PACKAGES=`python3 -c "import site; print(site.getsitepackages()[0])"`
powerline-daemon -q
. "$PY3_SITE_PACKAGES/powerline/bindings/zsh/powerline.zsh"

# Less highlighting
# source: https://gist.github.com/textarcana/4611277#gistcomment-1701305
# Setup: "brew install highlight"
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --quiet --force --style solarized-dark"
export LESS=" -R"
alias less='less -m -n -g -i --underline-special'

# asdf version manager
. $(brew --prefix asdf)/asdf.sh

# Load local configs/overrides
local_profile="${HOME}/local/profile.zsh"
if [[ -a $local_profile ]]; then
  source $local_profile
fi
