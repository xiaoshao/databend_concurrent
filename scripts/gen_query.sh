#!/bin/bash

PWD1=`pwd`
cd ./tpcds-kit/tools

#./dsqgen \
#      -DIRECTORY ../query_templates \
#      -INPUT  ../query_templates/templates.lst \
#      -VERBOSE Y \
#      -QUALIFY Y \
#      -SCALE 10000 \
#      -DIALECT postgresql \
#      -OUTPUT_DIR ${PWD}/query
#

for i in {1..99} ; do
      ./dsqgen \
                -DIRECTORY ../query_templates \
                -TEMPLATE  ../query_templates/query${i}.tpl \
                -DIALECT ansi \
                -FILTER Y > ${PWD1}/query/query${i}.sql
done