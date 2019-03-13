# Aliases
alias git=hub
alias hgrep='history | grep'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias clr='clear'

# Functions
source "$ZDOTDIR/.zfunctions"

# Editors
export EDITOR='vim'
export VISUAL='vim'

###########
# PATHS   #
###########

## NOTE: NOT USING TORCH ANYMORE
# torch packages
# export PATH="$HOME/torch/install/bin:$PATH"

# A place for local binaries
export PATH="$HOME/local/bin:$PATH"

# Set the GOPATH to use proper nucleus paths
export GOPATH="$HOME/.nucleus/bazel-gopath:$GOPATH" # nucleus default gopath
export GOROOT=$HOME/workspace/nucleus/bazel-nucleus/external/go_sdk # as instructed by gopath.sh

#####################
# ACTIVATE SOFTWARE #
#####################

## NOTE: NOT USING TORCH ANYMORE
# torch
# . "$HOME/torch/install/bin/torch-activate"

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# python virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
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

# Less highlighting
# source: https://gist.github.com/textarcana/4611277#gistcomment-1701305
# Setup: "brew install highlight"
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --quiet --force --style solarized-dark"
export LESS=" -R"
alias less='less -m -n -g -i --underline-special'

# Nvidia-specific configurations
source "$ZDOTDIR/nvidia.zsh"
