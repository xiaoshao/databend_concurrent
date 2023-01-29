#!/bin/bash
host=${1}
port=${2}
pass=${3}

mysql -h${host} -P${port} -u zwshao -p${pass}  <"src/main/resources/tpcds.sql"