#!/bin/bash
subfolder=$(date '+%Y_%m_%d')
dailypath="/var/www/html/log/$subfolder/"

mkdir -p $dailypath

# Dump the log file to a daily folder and lists it in the dump_list file. 
# Moves the the log file to a new folder with a specific name, then adds the log file absolute path to a file list 
bash /dockerscripts/log_dump.sh /workspace/log_server/server.log $dailypath >> /var/www/html/log/dump_list.txt

absolPathToFile=$(tail -n 1 /dockerscripts/dump_list.txt)
logname=${absolPathToFile##*/}
absolPathToJson="${absolPathToFile%.*}.json"

# Filters all entries except the lines containing "warn" or "error", then sends the output to a json file. A buffer file is used to pass data between the scripts 
bash /dockerscripts/log_filter.sh $absolPathToFile > /dockerscripts/tmp.log && bash /dockerscripts/log_format.sh /dockerscripts/tmp.log >> $absolPathToJson

# Adds the new json file to a list of processed json files
echo $absolPathToJson >> /dockerscripts/json_list.txt

# Creates and compress a tarball of the entire logs directory
tar -cvzf /var/www/html/log.tar.gz $dailypath
