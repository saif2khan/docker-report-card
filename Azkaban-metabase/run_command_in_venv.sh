#!/bin/bash
# A script that sources an virtual env and then runs a python command leveraging the venv's
# installed dependencies
# Written by Rex Gibson rex@knewton.com
source $1/bin/activate

exit_trap () {
    local lc="$BASH_COMMAND" rc=$?
    dt=`date +%Y-%m-%d\ %T.%N\:`
    dt_for_file=`date +%Y%m%d`
    localfile=`basename $0`
    echo $dt"Command [$lc] exited with code [$rc]"
    exit $rc
}

# Traps
trap exit_trap EXIT
set -e

cmd=$2
$cmd