#!/bin/bash
if [ $UID != 0 ]
then
    echo -e "\e[01;31mExecute this script with root privileges!\e[0m"
    exit 1
fi

date=$(date +%F)
time=$(date +%R)

source "/root/bin/backup/backup.cfg"

echo "$date - $time: Backup executed." >> $log_path/protocol.log

for i in "${hostnames[@]}"
do
    hostname="$i"
    image_name="backup_sd_card_$hostname"
    tarball_name="backup_hard_drive_$hostname"
    sd_card="/dev/mmcblk0"
    backup_path="/media/BACKUP/$hostname"

    if (( $current_backup_count >= $backup_amount+1 ))
    then
        echo "1" > $configuration_path/$current_backup_count_file
        current_backup_count=$(cat $configuration_path/$current_backup_count_file)
    fi

    clear
    echo -e "\e[01;37mSD Card Backup in Progress ...\e[0m"

    if [[ "$hostname" == "bananapi" ]]
    then
        echo -e "\e[01;30mBanana Pi ...\e[0m"
        dd if=$sd_card bs=8M of=$backup_path/$image_name.$current_backup_count.$image_suffix status=progress
        #tar -zcvpf $backup_path/$tarball_name.$current_backup_count.$tarball_suffix --directory=/media/BANANAPI .

    elif [[ "$hostname" == "raspberrypi" ]]
    then
        echo -e "\e[01;30mRaspberry Pi ...\e[0m"
        ssh root@raspberrypi "dd if=$sd_card bs=8M" | dd of=$backup_path/$image_name.$current_backup_count.$image_suffix
        #ssh root@raspberrypi "tar -zcvpf - --directory=/ --exclude=proc --exclude=sys --exclude=dev/pts --exclude=media --exclude=mnt ." | cat - > $backup_path/$image_name.$current_backup_count.$tarball_suffix
    fi
done

(( current_backup_count++ ))
echo "$current_backup_count" > $configuration_path/$current_backup_count_file

date=$(date +%F)
time=$(date +%R)
echo "$date - $time: Backup finished." >> $log_path/protocol.log
