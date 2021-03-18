#!/bin/bash
logfile=$1
destfolder=$2
filename=${logfile##*/}
#The first awk command allows us to keep only the lines matching "err" or "warn".
#The second one is there to add a carriage return at the end of each line
#The third awk removes the leading blankspaces added by the echo command.
echo -e $(awk '/err|warn/' $logfile | awk '{print $0"\\n"}') | awk '{ sub(/^[ \t]+/, ""); print }' > $destfolder/$filename

