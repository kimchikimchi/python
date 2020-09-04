#!/bin/bash

#
# simple script to maintain python virtual env.
# use venv instead of virtual_env
# See https://docs.python.org/3/tutorial/venv.html for details
#

ENVDIR=~/git/python/venv/.python3_default
# Set up virtual env for Python3

# Determine whether the script is sourced or not
# Source: https://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced
sourced=0
if [ -n "$ZSH_EVAL_CONTEXT" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) sourced=1;; esac
elif [ -n "$KSH_VERSION" ]; then
  [ "$(cd $(dirname -- $0) && pwd -P)/$(basename -- $0)" != "$(cd $(dirname -- ${.sh.file}) && pwd -P)/$(basename -- ${.sh.file})" ] && sourced=1
elif [ -n "$BASH_VERSION" ]; then
  (return 0 2>/dev/null) && sourced=1
else # All other shells: examine $0 for known shell binary filenames
  # Detects `sh` and `dash`; add additional shell filenames as needed.
  case ${0##*/} in sh|dash) sourced=1;; esac
fi

if [ $sourced -eq 0 ]; then
    echo "USAGE : . $0"4
    echo "Aborting..."
else
  if [ ! -d  $ENVDIR ]; then
      # If virtual env isn't working, delete the ENVDIR first
      # then rerun the line below
      python3 -m venv $ENVDIR
  fi

  . $ENVDIR/bin/activate

  python -V

  echo ""
  echo "Type 'deactivate' to remove virtual environment"
fi
