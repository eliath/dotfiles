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
  char          # Prompt character
)


SPACESHIP_RPROMPT_ORDER=(
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  exec_time     # Execution time
)

autoload -U promptinit; promptinit
prompt spaceship
