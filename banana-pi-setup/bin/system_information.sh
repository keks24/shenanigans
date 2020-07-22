#!/bin/bash
cpu_freq_path=/sys/devices/system/cpu/cpu0/cpufreq
cpu_temp_path=/sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034
uptime_path=/proc
hostname=`hostname`
TIMEOUT=1

cpu_freq_max=`cat $cpu_freq_path/scaling_max_freq`
cpu_temp_max=`cat $cpu_temp_path/temp1_max`
(( cpu_freq_max /= 1000 ))
(( cpu_temp_max /= 1000 ))

while(true)
do
    cpu_freq_min=`cat $cpu_freq_path/scaling_min_freq`
    cpu_freq_cur=`cat $cpu_freq_path/scaling_cur_freq`
    cpu_temp_cur=`cat $cpu_temp_path/temp1_input`
    uptime_cur=`cat $uptime_path/uptime | awk -F "." '{print $1}'`

    (( cpu_freq_min /= 1000 ))
    (( cpu_freq_cur /= 1000 ))
    (( cpu_temp_cur /= 1000 ))
    (( uptime_cur_sec = $uptime_cur % 60 ))
    (( uptime_cur_min = $uptime_cur / 60 % 60 )) 
    (( uptime_cur_hour = $uptime_cur / 3600 % 24 ))
    (( uptime_cur_day = $uptime_cur / 86400 ))

    echo -e "\\033c"
    echo -e "\e[01;37mSystem Information of $hostname\e[0m"
    echo -e "\e[01;37m-------------------------------\e[0m"
    echo -e "\e[01;37mCPU Frequency:\e[0m"
    echo -e "\e[01;37mMin: \t\t $cpu_freq_min MHz\e[0m"
    echo -e "\e[01;37mMax:\e[0m \t\t \e[01;31m$cpu_freq_max MHz\e[0m"

    if (( $cpu_freq_cur == $cpu_freq_min ))
    then
        echo -e "\e[01;37mCurrent:\e[0m \t \e[01;32m$cpu_freq_cur MHz\e[0m"

    else
        echo -e "\e[01;37mCurrent:\e[0m \t \e[01;31m$cpu_freq_cur MHz\e[0m"
    fi

    echo -e "\e[01;37m-------------------------------\e[0m"
    echo -e "\e[01;37mCPU Temperature:\e[0m"

    if (( $cpu_temp_cur <= 49 ))
    then
        echo -e "\e[01;37mCurrent:\e[0m \t \e[01;32m$cpu_temp_cur °C\e[0m"

    elif (( $cpu_temp_cur >= 50 && $cpu_temp_cur <= 59 ))
    then
        echo -e "\e[01;37mCurrent:\e[0m \t \e[01;33m$cpu_temp_cur °C\e[0m"

    else
        echo -e "\e[01;37mCurrent:\e[0m \t \e[01;31m$cpu_temp_cur °C\e[0m"
    fi

    echo -e "\e[01;37mMax:\e[0m \t\t \e[01;31m$cpu_temp_max °C\e[0m"
    echo -e "\e[01;37m-------------------------------\e[0m"
    echo -e "\e[01;37mSystem Uptime:\e[0m"
    echo -e "\e[01;37mCurrent: \t $uptime_cur_day "days " $uptime_cur_hour "hours " $uptime_cur_min "minutes " $uptime_cur_sec "seconds"\e[0m"

    sleep $TIMEOUT
done
