#!/bin/bash

# 0 6 */3 * * crontab-2.sh 




RAW= $(ps -o pid,user,%mem,command ax | grep -v PID | sort -bnr -k3 | awk'/[0-9]*/{print $1  : " $2 " : " $3}')

for in $RAW
do
if [ $3 -gt 0.8 ] ; then
log=file.txt
h=$(wc -l < file.txt)
if [ h -gt 50 ] ; then
echo "process name $2: pid $1: %mem $3: date $(date)" > $log   
else 
echo "process name $2: pid $1: %mem $3: date $(date)" >> $log  
fi
fi
done



