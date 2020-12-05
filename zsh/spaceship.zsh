zstyle ':prezto:module:prompt' theme 'spaceship'
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  golang        # Go section
  docker        # Docker section
  aws           # Amazon Web Services section
  pyenv         # Pyenv section
  #kubectl       # Kubectl context section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)


SPACESHIP_RPROMPT_ORDER=(
  exit_code     # Exit code section
  exec_time     # Execution time
  battery       # power level
)

SPACESHIP_BATTERY_THRESHOLD=20
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_COLOR=cyan

autoload -U promptinit; promptinit
prompt spaceship
