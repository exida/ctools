#!/bin/bash

for arg in $*; do
  if [[ -f $arg ]]; then
    command="$command $arg"
  fi
  if [[ -d $arg ]]; then
    include_dir="$include_dir $arg" 
  fi
done

function separator() {
  echo "=================="
  echo "=================="
  echo $1
}

DEFINES="" #-DFRAMAC" # -D__uint8_t_defined -D__uint16_t_defined -D__uint32_t_defined -D__int8_t_defined -D__int16_t_defined -D__int32_t_defined"

separator "Value access and Weak precondition"

frama-c -cpp-extra-args="-I $include_dir $DEFINES" -rte -then -rte-precond -print -wp -wp-prover alt-ergo \
-warn-unsigned-overflow \
-warn-unsigned-downcast \
-warn-signed-overflow \
-warn-signed-downcast \
-rte-div \
-rte-mem \
-rte-shift \
-rte-float-to-int \
-rte \
  -val \
  -machdep=x86_64 \
  $command | tee /tmp/output.txt

grep ": Unknown" /tmp/output.txt && echo ERROR 

separator "Metrics"
echo "frama-c -cpp-extra-args=\"-I $include_dir $DEFINES\" -metrics $command"
frama-c -cpp-extra-args="-I $include_dir $DEFINES" -metrics $command

