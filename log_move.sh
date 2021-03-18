#!/bin/bash
subfolder=$(date '+%Y_%m_%d')
filepath="/var/www/html/log/$subfolder/"
bash ./log_dump.sh ./server.log $filepath
filename=$(find $filepath -name Log-????-??-??-??-??-??.log)
echo "$filepath/$filename" >> ./dump_list.txt
bash ./log_filter.sh $filepath/$filename .


