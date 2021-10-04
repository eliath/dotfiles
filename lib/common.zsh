#!/usr/bin/env zsh

export DOTFILES=$HOME/dotfiles

# Function to check if we're on macOS
is_macos() {
  if uname | grep -q "Darwin"; then
    return 0
  fi
  return 1
}

dotmsg() {
  echo "----------"
  echo "[dotfiles] $@"
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
