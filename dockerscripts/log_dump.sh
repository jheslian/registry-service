#!/bin/bash

logfile=$1
destfolder=$2
logname="Log-$(date '+%Y-%m-%d-%H-%M-%S').log"

cp $logfile $destfolder/$logname && echo "" > $logfile && echo "$destfolder$logname"
