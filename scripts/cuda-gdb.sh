#!/bin/bash

# check if directory was supplied
if [ $# -eq 0 ]; then
    echo "provide program and arguments"
    exit 1
fi

cd ".."

make clean
make debug

cd testcases || (echo "failed to cd to testcases" && exit)

# shellcheck disable=SC2121
set cuda memcheck on
"/usr/local/cuda-11.0/bin/cuda-gdb" "$1"