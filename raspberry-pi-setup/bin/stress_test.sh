#!/bin/bash
#Simple stress test for system. If it survives this, it's probably stable.
#Free software, GPL2+

date=$(date +%F)
time=$(date +%R)
log_path="/var/log/custom"

echo "$date - $time: Stress Test executed." >> $log_path/Protocol.log
clear
echo "Testing overclock stability..."

#Max out the CPU in the background (one core). Heats it up, loads the power-supply.
nice yes > /dev/null &

#Read the entire SD card 10x. Tests RAM and I/O
for i in `seq 1 10`
do
	echo reading: $i
	dd if=/dev/mmcblk0 of=/dev/null bs=4M
done

#Writes 512 MB test file, 10x.
for i in `seq 1 10`
do
	echo writing: $i
	dd if=/dev/zero of=deleteme.dat bs=1M count=512
	sync
done

#Cleanup
killall yes
rm deleteme.dat

#Print summary. Anything nasty will appear in dmesg.
cpu_freq_cur=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
cpu_temp=`cat /sys/class/thermal/thermal_zone0/temp`

(( cpu_freq_cur /= 1000 ))
(( cpu_temp /= 1000 ))

echo -n "CPU freq: $cpu_freq_cur MHz"
echo -n "CPU temp: $cpu_temp °C"
dmesg | tail

echo "Not crashed yet, probably stable."

date=$(date +%F)
time=$(date +%R)
echo "$date - $time: Stress Test finished." >> $log_path/Protocol.log
