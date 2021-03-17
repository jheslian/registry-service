#!/bin/bash
#string='12My long string'
#if [[ $string == [0-9][0-9]"My long"* ]]; then
#  echo "It's there!"
#fi
cat $1 | while read line

do
    if [[ $line == [??/??/????*  ]]; then
      	date=${line:1:19}
        if [[ $line == *warning* ]]; then
	     type="warning"
	elif [[ $line == *error* ]]; then
	     type="error"			
	fi      
            # message=$line | cut -d':' -f4-  | awk '{ sub(/^[ \t]+/, ""); print }'
	#	echo $($line | cut -d':' -f4-  | awk '{ sub(/^[ \t]+/, ""); print }')
             echo "$date $type"
    fi	

done


