#!/bin/bash
date=$(date +%F)
time=$(date +%R)
log_path="/var/log/custom"
torrent_id=`transmission-remote -l | grep 100% | grep Done | awk '{print $1}'`

echo "$date - $time: Transmission Clean Up executed." >> $log_path/Protocol.log

for i in $torrent_id
do
	transmission-remote -t $i -r
done

rm /media/BANANAPI/Transmission/watch/*.added > /dev/null 2>&1

date=$(date +%F)
time=$(date +%R)
echo "$date - $time: Transmission Clean Up finished." >> $log_path/Protocol.log
