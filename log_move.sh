#!/bin/bash
subfolder=$(date '+%Y_%m_%d')
dailypath="/var/www/html/log/$subfolder/"

mkdir -p $dailypath

# Dump the log file to a daily folder and lists it in the dump_list file. 
#Validates 1/, 2/, 3/
bash ./log_dump.sh ./server.log $dailypath >> ./dump_list.txt

absolPathToFile=$(tail -n 1 ./dump_list.txt)
logname=${absolPathToFile##*/}
absolPathToJson="${absolPathToFile%.*}.json"
archiveName="/var/www/html/${logname%.*}.tar.gz"
#Validates 4/
sudo bash ./log_filter.sh $absolPathToFile > ./tmp.log && sudo bash log_format.sh tmp.log >> $absolPathToJson

#Validates 5/
echo $absolPathToJson >> ./json_list.txt

#Validates 6/
tar -cvzf $archiveName $dailypath
