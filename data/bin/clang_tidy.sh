#!/bin/bash 

clang-tidy $1 -checks=*,-readability-*,-hicpp-no-assembler -- -Idata/include/

