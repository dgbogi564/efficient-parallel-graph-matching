#!/bin/bash

cd "scripts" || (echo "failed to cd to scripts" && exit)
bash cuda-memcheck.sh 10
