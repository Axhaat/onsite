#!/bin/bash

echo enter the file name with extension 
read file
nc host.example.com 1234 < filename.in
echo "file $(date +%T)" > $log 
echo enter the url 
read add
curl $add -0 file=file.html
#nc -l 1234 > filename.out  
echo "file $(date +%T)" > $log2 

