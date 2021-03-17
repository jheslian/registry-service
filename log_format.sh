#!/bin/bash
#string='12My long string'
#if [[ $string == [0-9][0-9]"My long"* ]]; then
#  echo "It's there!"
#fi
cat $1 | while read line
do
if [[ $line == [??/??/????*  ]]; then
	echo $line

fi	

done

