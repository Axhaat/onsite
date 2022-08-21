#!/bin/bash

## Note: will kill the top-most process if the $CPU_LOAD is greater than the $CPU_limit.
echo
echo checking the  process ...

CPU_LOAD=$(uptime | cut -d"," -f4 | cut -d":" -f2 | cut -d" " -f2 | sed -e "s/\.//g")
CPU_limit=60
PROCESS=$(ps aux r)
TOPPROCESS=$(ps -eo pid -eo pcpu -eo command | sort -k 2 -r | grep -v PID | head -n 1)

if [ $CPU_LOAD -gt $CPU_limit ] ; then
  # kill -9 $(ps -eo pid | sort -k 1 -r | grep -v PID | head -n 1) #original
  # kill -9 $(ps -eo pcpu | sort -k 1 -r | grep -v %CPU | head -n 1)
  kill -9 $TOPPROCESS
  echo killed $TOPPROCESS
  echo load average is at $CPU_LOAD
  ps aux r




  log=log_file.log
  echo "Top-most process killed $TOPPROCESS  and its properties are  $PROCESS" >> $log
  
  
  
  
else
 echo all processes are working perfectly. 
 echo load average is at $CPU_LOAD
 ps aux r
fi
exit 0


