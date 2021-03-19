#!/bin/bash
# Adds a leading [ to the output file
echo -e "["
cat $1 | while read line
# Recover the date, type, message on each line
do 
    # Filters the line that contains a date	
    if [[ $line == [??/??/????*  ]]; then
      	date=${line:1:19}
        # Recovers the type of a message
        if [[ $line == *warning* ]]; then
	     type="warning"
	elif [[ $line == *error* ]]; then
	     type="error"			
	fi   
             # Acquire the message    
             message=$(echo $line | cut -d':' -f4-  | awk '{ sub(/^[ \t]+/, ""); print }')
             # Then builds a json object to append to the output
             object="{\n \"date\":\"$date\",\n \"type\":\"$type\",\n \"message\":\"$message\" \n },"  
             echo -e $object 
    fi	

done
#Adds a closing brace to output file
echo -e "]"
