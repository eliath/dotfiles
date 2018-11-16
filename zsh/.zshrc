# Aliases
alias git=hub
alias hgrep='history | grep'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'

# Functions
source "$ZDOTDIR/.zfunctions"

# Editors
export EDITOR='vim'
export VISUAL='vim'

###########
# PATHS   #
###########
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

# python virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=true
# create commands to override pip restriction.
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
  'history-substring-search'

# Start TMUX on login
zstyle ':prezto:module:tmux:auto-start' local 'yes'

# Activate Prezto
PREZTO_INIT="$ZDOTDIR/.zprezto/init.zsh"
[ -f "$PREZTO_INIT" ] && source "$PREZTO_INIT"
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# powerline
PY3_SITE_PACKAGES=`python3 -c "import site; print(site.getsitepackages()[0])"`
powerline-daemon -q
. "$PY3_SITE_PACKAGES/powerline/bindings/zsh/powerline.zsh"
