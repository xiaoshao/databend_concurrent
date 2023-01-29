#!/bin/bash

#arr=('ap_perform','ap_static','call_center','catalog_page','catalog_returns', \
#'catalog_sales','customer','customer_address','customer_demographics','date_dim',\
#'dbgen_version','household_demographics','income_band','inventory','item','promotion ',\
#'reason','ship_mode','store','store_returns','store_sales','test1','time_dim','warehouse ',\
#'web_page','web_returns','web_sales','web_site')
database_host=${1}
database_port=${2}
pass=${3}
for file_name in `ls ../data/*.dat`; do
  table_file=$(echo "${file_name##*/}")

#  if [[ ${arr[*]} =~ ${table_file} ]]; then
    table_name=$(echo "${table_file}" | cut -d '.' -f 1 | tr '[:upper:]' '[:lower:]')
    upload_sql="INSERT INTO test.$table_name FORMAT CSV"

    echo "$upload_sql <--- $(du -h $file_name)"

    echo ${file_name}

    curl -XPUT "http://zwshao:${pass}@${database_host}:${database_port}/v1/streaming_load" \
      -H "insert_sql: insert into test.${table_name} file_format=(type='CSV' skip_header=0 field_delimiter='|')" \
      -F "upload=@"${file_name}""

#    curl -XPUT http://root:@localhost:8082/v1/streaming_load -H "insert_sql: insert into test.${table_name} format csv" \
#    -H "skip_header: 0" -H "format_field_delimiter: |" -H "record_delimiter: \n" -F "upload=@"${file_name}""
#  fi
done