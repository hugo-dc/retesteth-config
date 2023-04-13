#!/bin/bash
if [ -z "$PYSPECS_PATH" ]
then
    >&2 echo "Error: env variable 'PYSPECS_PATH' is not set!"
    exit 1;
fi

cd $PYSPECS_PATH
python3 -m venv ./venv/
source ./venv/bin/activate

SRCPATH=$1
FILLER=$2
TESTCA=$3
OUTPUT=$4
EVMT8N=$5
FORCER=$6

ADDFLAGS=""
if [ "$TESTCA" != "null" ]; then
    ADDFLAGS="$ADDFLAGS --test-case $TESTCA"
fi
if [ "$FORCER" != "null" ]; then
    ADDFLAGS="$ADDFLAGS --force-refill"
fi

tf --filler-path $SRCPATH --output $OUTPUT --test-module $FILLER $ADDFLAGS --no-output-structure --evm-bin $EVMT8N

