#!/bin/bash

#log
echo "(time ($1 $2 $3 -o $4 > $5 2> $6)) 2> $7" > trace_compile

TIMEOUT=10

function run() {
  SUPERVISOR_PID=$1
  shift

  if grep -q "SPLIT TAG" $3; then
    < $3 awk 'BEGIN {c = 0} /SPLIT TAG/{c++; next} {print > "outfile." c ".c"}' > AWK.txt
    (time ($1 $2 outfile.*.c -o $4 > $5 2> $6)) 2> $7
    #rm outfile.*
  else
    (time ($1 $2 $3 -o $4 > $5 2> $6)) 2> $7
  fi
  kill -9 $SUPERVISOR_PID > /dev/null
}

echo "compile.sh: $1 $2 $3 $4 $5 $6 $7"
run $$ "$1" "$2" "$3" "$4" "$5" "$6" "$7" &
CHILD_PID=$!

sleep $TIMEOUT
echo "Process received a SIGKILL signal (after ${TIMEOUT}s timeout)" > $6
kill -9 $CHILD_PID > /dev/null

