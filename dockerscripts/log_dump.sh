#!/bin/bash

logfile=$1
destfolder=$2
logname="Log-$(date '+%Y-%m-%d-%H-%M-%S').log"
#Copy the original log file to a new location according to the destination folder passed in the 2nd argument
cp $logfile $destfolder/$logname && echo "" > $logfile && echo "$destfolder$logname"
