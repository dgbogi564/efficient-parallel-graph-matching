#!/bin/bash

# check if number of threads was supplied
if [ $# -eq 0 ]; then
    echo "provide number of threads"
    exit 1
fi

cd ".."

make clean
make

cd "testcases" || (echo "failed to cd to testcases" && exit)
for i in {1..9}
do
  "../match" -input input"$i".mtx -output result"$i".txt -threads "$1" 2> "log.txt"
  if cmp -s "result$i.txt" "output$i.txt";
    then echo "testcase $i passed"
    else echo "testcase $i failed"
  fi
done