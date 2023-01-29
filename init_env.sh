#!/bin/bash -e
database_host=${1}
database_port=${2}
database_http_port=${3}
./scripts/init_database.sh ${database_host} ${database_port} zwshao
./scripts/gen_data.sh 10
./scripts/import_data.sh ${database_host} ${database_http_port} zwshao
