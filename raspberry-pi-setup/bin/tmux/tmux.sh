#!/bin/bash
# Custom Set Up
# | 1----------------- | 3----------------- |
# |        htop        | System Information |
# | 2----------------- | 4----------------- |
# |  tail Protocol.log |    tail auth.log   |
# | 5------------ | 6---------------------- |
# |               |   tail cups access_log  |
# |     nload     | 7---------------------- |
# |               |   tail cups error_log   |
# | ------------- | ----------------------- |

tmux new-session -n "$(whoami)@$(hostname)" -d

tmux split-window -d -v
tmux select-pane -t 1
tmux split-window -d -h
tmux split-window -d -v #-p 35
tmux select-pane -t 3
tmux split-window -d -v #-p 35
tmux select-pane -t 5
tmux split-window -d -h -p 60
tmux select-pane -t 6
tmux split-window -d -v #-p 35

tmux send-keys -t 1 "htop" enter
tmux send-keys -t 2 "clear && tail -fn 15 /var/log/custom/protocol.log" enter
tmux send-keys -t 3 "bash /home/pi/bin/system_information.sh" enter
tmux send-keys -t 4 "clear && less +F /var/log/auth.log" enter
tmux send-keys -t 5 "nload -u K wlan0 eth0 lo" enter
tmux send-keys -t 6 "clear && less +F /var/log/cups/access_log" enter 
tmux send-keys -t 7 "clear && less +F /var/log/cups/error_log" enter

tmux new-window -d

tmux send-keys -t 0:2 "clear" enter

tmux select-window -t 1

tmux select-pane -t 7 

tmux attach
