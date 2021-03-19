#!/bin/bash

echo -e "["
cat $1 | while read line
# recover the date, type, message on each line

do 
    # filters the line that contains a date	
    if [[ $line == [??/??/????*  ]]; then
      	date=${line:1:19}
        # recovers the type of a message
        if [[ $line == *warning* ]]; then
	     type="warning"
	elif [[ $line == *error* ]]; then
	     type="error"			
	fi   
             # acquire the message    
             message=$(echo $line | cut -d':' -f4-  | awk '{ sub(/^[ \t]+/, ""); print }')
                         
             object="{\n \"date\":\"$date\",\n \"type\":\"$type\",\n \"message\":\"$message\" \n },"  
             echo -e $object 
    fi	

done

echo -e "]"
