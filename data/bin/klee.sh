#!/bin/bash

echo $1 > /tmp/klee.txt
echo $2 >> /tmp/klee.txt
echo $3 >> /tmp/klee.txt
echo $4 >> /tmp/klee.txt
echo $5 >> /tmp/klee.txt
echo $6 >> /tmp/klee.txt

SOURCE=$3
INCLUDES=$2
RUNDIR=/tmp/klee-ctools
SRCMOD=$RUNDIR/src.c
KLEEBC=$RUNDIR/src.bc

rm -fr $RUNDIR
mkdir -p $RUNDIR

cp $INCLUDES/* $RUNDIR
cp $SOURCE $SRCMOD

sed -e "s/main/main_klee/g" -i $SRCMOD

echo "#include <klee/klee.h>"                               >> $SRCMOD
echo "int main(int argc, char ** argv) {"                                         >> $SRCMOD
# echo "  int argc;"                                          >> $SRCMOD
#echo "  klee_make_symbolic(&argc, sizeof(argc), \"argc\");" >> $SRCMOD
#echo "  klee_assume(argc==1);"                              >> $SRCMOD
echo "  return main_klee(argc, (void *) 0);"                >> $SRCMOD
echo "}"                                                    >> $SRCMOD

echoerr() { echo "$*" 1>&2; }
cd $RUNDIR
echoerr "### compilation to llvm bytecode"
echoerr ""
clang -emit-llvm -c -g $SRCMOD 
echoerr ""
echoerr "### runnig klee"
echoerr ""
klee $KLEEBC

