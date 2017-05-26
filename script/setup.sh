#!/bin/bash

function finish {
  popd >> /dev/null
}
trap finish EXIT
pushd "$(dirname "$0")" >> /dev/null
. common.sh

# what are the available setup scripts?
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

runSetupScript() {
  echo "Running setup for $1 ..."
  source "$SCRIPT_DIR/$1.sh"
}

if [ $1 == "all" ]; then
  # loop thru all scripts and run them
  for scriptName in "${ALL_SCRIPTS[@]}"; do
    runSetupScript "$scriptName"
  done
  exit 0
fi

# check args first
for scriptName in "$@"; do
  if ! arrayContains "$scriptName" "${ALL_SCRIPTS[@]}"; then
    echo "Invalid argument: $scriptName"
    printUsage
  fi
done

# execute given scripts
for scriptName in "$@"; do
  runSetupScript "$scriptName"
done

echo "... done."
