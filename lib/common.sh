#!/usr/bin/env bash

export DOTFILES="$HOME/dotfiles"

is_macos() {
  [[ "$(uname)" == Darwin ]]
}

dotmsg() {
  echo "----------"
  echo "[dotfiles] $*"
  echo "----------"
}

_todos=()
log_todo() {
  _todos+=("$1")
}

print_result() {
  echo ""
  echo "----------"
  if (( ${#_todos[@]} )); then
    echo "[dotfiles] to complete setup:"
    for todo in "${_todos[@]}"; do
      echo ""
      echo "  * ${todo}"
      echo ""
    done
  else
    echo "[dotfiles] setup complete"
  fi
}
