zstyle ':prezto:module:prompt' theme 'spaceship'
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exit_code     # Exit code section
  line_sep      # Line break
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  venv          # Python virtual environment
  python        # Python version (asdf-aware)
  golang        # Go section
  node          # Node.js section
  aws           # Amazon Web Services section
  docker        # Docker section
  exec_time     # Execution time
  battery       # power level
  kubectl       # Kubectl context section
)

# Global defaults
SPACESHIP_PROMPT_DEFAULT_PREFIX=""

SPACESHIP_BATTERY_THRESHOLD=20
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_COLOR=cyan

# Python virtual environment settings
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_SYMBOL="🐍 "
SPACESHIP_VENV_COLOR="blue"

# Python version settings (asdf-aware)
SPACESHIP_PYTHON_SHOW=true

# Kubectl settings (disabled by default in v4)
SPACESHIP_KUBECTL_SHOW=true
