#!/bin/bash
#description: Tomcat log is gzip  compression
#create date 20170220 by ljm
#file name is gzip_remove_project.sh

project="portal server wangdaixiehui"



gzip_remove_project(){
for i in $project
do
	web_dir=/home/tomcat/tomcat-7.0.52-p2p-$i/logs
	if [[ -d $web_dir ]]; then
		find $web_dir -type f -mtime +1 |xargs -i  gzip {} #One day before the log log compression
		find $web_dir -type f -name \*.gz -mtime +30 |xargs rm -rf     #Removal of more than 30 days of compressed logs
	fi
done
}

gzip_remove_project
