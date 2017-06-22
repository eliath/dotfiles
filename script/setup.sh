#!/bin/bash

function finish {
  popd >> /dev/null
}
trap finish EXIT
pushd "$(dirname "$0")" >> /dev/null
. variables.sh

# Get the available scripts
ALL_SCRIPTS=()
for FILENAME in $SCRIPT_DIR/*; do
  FILENAME=$(basename $FILENAME .sh)
  if [ ! $FILENAME == "common" ] && [ ! $FILENAME == "setup" ]; then
    ALL_SCRIPTS+=("$FILENAME")
  fi
done

USAGE="A script to setup the dotfiles
Usage: ./setup.sh <target>
where <target> is:
  all$(printf "  %s " "${ALL_SCRIPTS[@]}")"
function printUsage {
  echo "$USAGE"
  exit 1
}
if [ $# -eq 0  ]; then
  printUsage
fi

arrayContains() {
  local seeking=$1; shift
  local found=1
  for elt; do
    if [[ $elt == $seeking ]]; then
      found=0
      break
    fi
  done
  return $found
}

printError() {
  echo -e "\n[DOTFILES:ERROR] $1\n"
}

printSection() {
  echo ""
  echo "*****************************"
  echo "[DOTFILES] $1"
  echo "*****************************"
  echo ""
}

runSetupScript() {
  printSection "Running setup for $1 ..."
  source "$SCRIPT_DIR/$1.sh"
}

if [ $1 == "all" ]; then
  . lazy_init.sh
  # loop thru all scripts and run them
  for scriptName in "${ALL_SCRIPTS[@]}"; do
    runSetupScript "$scriptName"
  done
  echo -e "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo "[DOTFILES] Success." 
  echo "[DOTFILES] Check the README for further instructions."
  exit 0
fi

# Error-handling: Check if arg given exists as script
for scriptName in "$@"; do
  if ! arrayContains "$scriptName" "${ALL_SCRIPTS[@]}"; then
    printError "Invalid argument: $scriptName"
    printUsage
  fi
done

# execute given scripts
for scriptName in "$@"; do
  runSetupScript "$scriptName"
done

echo "... done."
