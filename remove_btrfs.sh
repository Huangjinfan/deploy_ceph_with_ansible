#!/bin/sh

btrfs subvolume list / | grep home/marmot/osd > a.out
awk '{print $9}' a.out | while read line
do
    btrfs subvolume delete "/${line}"
done

