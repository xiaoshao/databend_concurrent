#!/bin/bash
SCALE_COUNT=${1}
PWD=${pwd}
cd ./tpcds-kit/tools
make OS=MACOS
echo ${PWD}/data
./dsdgen -DIR ${PWD}/data -SCALE $SCALE_COUNT