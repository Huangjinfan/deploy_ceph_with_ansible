#!/bin/sh

h=`hostname`


cat /home/marmot/map.txt | grep $h | awk '{print $2}' | while read line
do
	ceph-osd -i ${line} --mkfs
done
