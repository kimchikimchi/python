#!/bin/bash

#
# simple script to maintain python virtual env.
# use venv instead of virtual_env
# See https://docs.python.org/3/tutorial/venv.html for details
#

ENVDIR=~/git/python/venv/.python3_default
# Set up virtual env for Python3

if  [ $# == 0 ] ; then
    echo "USAGE : . $0"
    echo "Aborting..."
    exit 1
fi

if [ ! -d  $ENVDIR ]; then
    # If virtual env isn't working, delete the ENVDIR first
    # then rerun the line below
    python3 -m venv $ENVDIR
fi

. $ENVDIR/bin/activate

python -V

echo ""
echo "Type 'deactivate' to remove virtual environment"
