#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/lib64
export ASAN_OPTIONS=verbosity=1

# log
echo "(time ($1 $2 $3 > $4 2> $5)) 2> $6" > trace_run

TIMEOUT=100

function run() {
  SUPERVISOR_PID=$1
  shift
  (time ($1 $2 $3 > $4 2> $5)) 2> $6
  kill -9 $SUPERVISOR_PID > /dev/null
}

echo "run.sh: $1 $2 $3 $4 $5 $6 $7"

run $$ "$1" "$2" "$3" "$4" "$5" "$6" "$7" &
#run $$ "$1" "$3" "$2" "$4" "$5" "$6" "$7" &
CHILD_PID=$!

sleep $TIMEOUT
echo "Process received a SIGKILL signal (after ${TIMEOUT}s timeout)" > $5
kill -9 $CHILD_PID > /dev/null

