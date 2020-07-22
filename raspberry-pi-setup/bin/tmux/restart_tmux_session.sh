#!/bin/bash
if [ $UID == 1000 ]
then
    tmux kill-session
    bash /home/pi/bin/Tmux.sh

else
    su - pi -c "tmux kill-session"
    cd /home/pi && su - pi -c "/home/pi/bin/Tmux.sh"
fi
