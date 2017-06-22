#!/bin/bash

graceful_exit() {
  popd >> /dev/null
}
trap graceful_exit EXIT
DOTFILES="$HOME/dotfiles"
SCRIPT_DIR="$DOTFILES/script"
pushd "$DOTFILES" >> /dev/null
TARGETS=($(
  find $DOTFILES/script -type f -maxdepth 1 -name "*.sh" \
    -not -name "variables.sh" -not -name "lazy_init.sh" \
    | xargs basename | sed s'/\.sh//'))

USAGE="Dotfiles installation script
Usage: ./install.sh [targets]

Available targets:
$(printf "  %s\n" "${TARGETS[@]}")
"
usageError() {
  echo "$USAGE"
  exit 1
}

printError() {
  echo "[DOTFILES:ERROR] $1"
  echo ""
}

printInfo() {
  echo "[DOTFILES] $1"
}

printSection() {
  echo ""
  echo "**************************************************"
  printInfo $1
  echo ""
}

validateTarget() {
  local target=$1; shift
  for t in "${TARGETS[@]}"; do
    if [[ $t == $target ]]; then
      return 0
    fi
  done
  return 1
}

runTarget() {
  if ! validateTarget "$1"; then
    printError 'Target "$1" does not exist.'
    usageError
  fi
  printSection "Running $1 setup scripts..."
  source "$SCRIPT_DIR/$1.sh"
}

runAll() {
  echo "[DOTFILES] Running all targets..."
  for t in "${TARGETS[@]}"; do
    runTarget $t
  done
}

if [ $# -eq 0 ]; then
  printInfo "Running all targets..."
  runAll
elif [ $# -eq 1 ]; then
  if [ $1 == "help" ]; then
    usageError
  elif [ $1 == "all" ]; then
    runAll
  else
    runTarget $1
  fi
else
  for t in "$@"; do
    runTarget $t
  done
fi

echo "[DOTFILES] Setup complete."
