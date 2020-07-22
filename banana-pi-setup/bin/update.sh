#!/bin/bash
date=$(date +%F)
time=$(date +%R)
log_path="/var/log/custom"

if [ $UID != 0 ]
then
    echo -e "\e[01;31mExecute this script with root privileges!\e[0m"
    exit 1
fi

echo "$date - $time: Update executed." >> $log_path/protocol.log

clear
while(true)
do
    ps aux | grep "Backu[p]"
    return_code="$?"

    if [ $return_code == 1 ]
    then
        clear
        echo -e "\e[01;33mChecking for new updates ...\e[0m"

        apt-get update | tee -a $log_path/update/update.log

        apt-get dist-upgrade -s | grep "will be upgraded" > /dev/null 2>&1
        return_code="$?"

        if [ $return_code == 0 ]
        then
            echo -e "\e[01;32mNew updates found!\e[0m"
            apt-get dist-upgrade -y | tee -a $log_path/dist-upgrade/dist-upgrade.log
            apt-get autoclean -y | tee -a $log_path/autoclean/autoclean.log
            apt-get autoremove -y | tee -a $log_path/autoremove/autoremove.log

            date=$(date +%F)
            time=$(date +%R)
            echo "$date - $time: Update finished: Updates found!" >> $log_path/protocol.log
            break

        else
            echo -e "\e[01;31mNo updates found!\e[0m"
            date=$(date +%F)
            time=$(date +%R)
            echo "$date - $time: Update finished: No updates found!" >> $log_path/protocol.log
            break
        fi

    else
        echo -e "\e[01;31mBackup is in progress, next retry in 1 hour ...\e[0m"
        sleep 3600
    fi
done

for i in {29..0}
do
    clear
    echo -e "\e[01;31mThe System will restart in $i seconds!\e[0m"
    sleep 1

    if [ $i == 0 ]
    then
        /sbin/shutdown -r now
        exit 0
    fi
done
