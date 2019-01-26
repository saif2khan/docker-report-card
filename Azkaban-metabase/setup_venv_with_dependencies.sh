#!/bin/bash
# a script that takes an input virtual env name, creates it and takes a requirements file,
# an installs all the depenencies in the requirements file.
# The purpose is to allow venvs to be installed at run time for azkaban
set -e
exit_trap () {
    local lc="$BASH_COMMAND" rc=$?
    dt=`date +%Y-%m-%d\ %T.%N\:`
    dt_for_file=`date +%Y%m%d`
    localfile=`basename $0`
    echo $dt"Command [$lc] exited with code [$rc]"
    exit $rc
}

printv () {

    echo `date +%Y-%m-%d\ %T.%N\:`" $1"
}

if [ -z $1 ]
then
    echo "you must enter a new venv name as \$1"
fi

if [ -z $2 ] && [ -e $2 ]
then
    echo "you must enter path to a requirements file that exist in \$2"
fi

if [ -z $3 ]
then
    PYPI_HOST="https://pypip.knewton.net/simple"
else
    PYPI_HOST=$3
fi

export LC_ALL=C
printv "creating virtualenv $1"
python3 -m venv $1

printv "activating virtualenv $1"
source $1/bin/activate

printv "installing requirements file %2"
pip install -r $2

printv "installing requirements completed successfully"