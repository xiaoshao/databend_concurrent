#!/bin/bash

arr=('')

for file_name in `ls ./databend/*.dat`; do
  table_file=$(echo "${file_name##*/}")

  if [[ ${arr[*]} =~ ${table_file} ]]; then
    table_name=$(echo "${table_file}" | cut -d '.' -f 1 | tr '[:upper:]' '[:lower:]')
    upload_sql="INSERT INTO $table_name FORMAT CSV"

    echo "$upload_sql <--- $(du -h $file_name)"

    curl -XPUT "http://root:@localhost:8000/v1/streaming_load" -H "insert_sql: insert into perfn.${table_name} format csv" \
    -H "skip_header: 0" -H "format_field_delimiter: |" -H "record_delimiter: \n" -F "upload=@"${file_name}""
  fi
done