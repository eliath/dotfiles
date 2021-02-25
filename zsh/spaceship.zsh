zstyle ':prezto:module:prompt' theme 'spaceship'
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exit_code     # Exit code section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  rprompt_prefix
  golang        # Go section
  node          # Node.js section
  aws           # Amazon Web Services section
  docker        # Docker section
  pyenv         # Pyenv section
  exec_time     # Execution time
  battery       # power level
  #kubectl       # Kubectl context section
  rprompt_suffix
)

# stolen from https://github.com/denysdovhan/spaceship-prompt/issues/558#issuecomment-451918947
# > borrowed from __p9k_prepare_prompts
# > RPROMPT_SUFFIX='%{'$'\e[1B''%}' # one line down
# > RPROMPT_PREFIX='%{'$'\e[1A''%}' # one line up
spaceship_rprompt_prefix() {
  echo -n '%{'$'\e[1A''%}'
}
spaceship_rprompt_suffix() {
  echo -n '%{'$'\e[1B''%}'
}

SPACESHIP_BATTERY_THRESHOLD=20
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_COLOR=cyan

autoload -U promptinit; promptinit
prompt spaceship
