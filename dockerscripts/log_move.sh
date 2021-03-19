#!/bin/bash
subfolder=$(date '+%Y_%m_%d')
dailypath="/var/www/html/log/$subfolder/"

mkdir -p $dailypath

# Dump the log file to a daily folder and lists it in the dump_list file. 
#Validates 1/, 2/, 3/
bash /dockerscripts/log_dump.sh /workspace/log_server/server.log $dailypath >> /dockerscripts/dump_list.txt

absolPathToFile=$(tail -n 1 /dockerscripts/dump_list.txt)
logname=${absolPathToFile##*/}
absolPathToJson="${absolPathToFile%.*}.json"

#Validates 4/
bash /dockerscripts/log_filter.sh $absolPathToFile > /dockerscripts/tmp.log && bash /dockerscripts/log_format.sh /dockerscripts/tmp.log >> $absolPathToJson

#Validates 5/
echo $absolPathToJson >> /dockerscripts/json_list.txt

#Validates 6/
tar -cvzf /var/www/html/log.tar.gz $dailypath
