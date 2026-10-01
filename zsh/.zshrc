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
  alias less='less -m -n -g -i --underline-special'
  # ls colors
  unset LS_COLORS
  CLICOLOR=1
  CLICOLOR_FORCE=1
else # Linux
  # ls colors
  alias ls='ls --group-directories-first -F --color=auto'
fi
export LESS=" -R "

###########
# PATHS   #
###########

add_to_path "${HOME}/.local/bin"

# less syntax highlight. After PATH setup: on Ubuntu, bat is a symlink in
# ~/.local/bin.
command -v bat >/dev/null && export LESSOPEN="| bat --color=always --style=plain %s"

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

# PREZTO #############################################
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'history' \
  'history-substring-search' \
  'directory' \
  'spectrum' \
  'utility' \
  'syntax-highlighting' \
  'ssh' \
  'git' \
  'contrib-prompt' \
  'docker' \
  'homebrew' \
  'node' \
  'command-not-found' \
  'completion' \
  'prompt'

# Spaceship prompt configuration
zstyle ':prezto:module:prompt' theme 'spaceship'
export SPACESHIP_CONFIG="$ZDOTDIR/spaceship.zsh"

# activate Prezto
prezto_init=$ZDOTDIR/.zprezto/init.zsh
[[ -s $prezto_init ]] && . $prezto_init

# extra git alias not provided by prezto
alias gfb='git fb'
alias gwdn='git --no-pager diff --name-only'
alias gwdn1='git --no-pager diff --name-only HEAD~1'

function gbxm() {
  local branch
  branch="$(git branch --show-current)" || return
  if [[ -z "$branch" ]]; then
    echo "gbxm: not on a branch" >&2
    return 1
  fi
  if [[ "$branch" == "main" ]]; then
    echo "gbxm: already on main" >&2
    return 1
  fi

  git checkout main && git pull --ff-only origin main && git branch --delete --force "$branch"
}

# de-dup fpath
fpath=(${(u)fpath[@]})

# atuin - magical shell history
if [ -f "${HOME}/.atuin/bin/atuin" ]; then
  export PATH="${HOME}/.atuin/bin:${PATH}"
  eval "$(atuin init zsh)"
fi

# AppImage sets ARGV0 to the AppImage path, which mise reads to identify the
# shim being called. Unset it before activating mise so it doesn't mistake
# AppImages for shims.
[[ -n "$APPIMAGE" ]] && unset ARGV0

# mise version manager (load this last to prevent being overwritten)
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Machine-local overrides (not in this repo)
local_profile="${HOME}/.config/zsh/profile.zsh"
[[ -s $local_profile ]] && . $local_profile
