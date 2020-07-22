#!/bin/bash
# window set up
# | 1----------------- | 3----------------- |
# |        htop        | System Information |
# | 2----------------- | 4----------------- |
# |  tail protocol.log |     nload -u K     |
# | 5-------------------- | 7-------------- |
# |  transmission-remote  |                 |
# | 6-------------------- |  Zsh (Cursor)   |
# |      pyLoadCli        |                 |
# | --------------------- | --------------- |

tmux new-session -n "$(whoami)@$(hostname)" -d

tmux split-window -d -t 1 -v
tmux select-pane -t 1
tmux split-window -d -h
tmux split-window -d -v
tmux select-pane -t 3
tmux split-window -d -v
tmux select-pane -t 5
tmux split-window -d -h -p 40
tmux select-pane -t 5
tmux split-window -d -v -p 60

tmux send-keys -t 1 "htop" enter
tmux send-keys -t 2 "clear && tail -fn 15 /var/log/custom/protocol.log" enter
tmux send-keys -t 3 "bash /home/pi/bin/system_information.sh" enter
tmux send-keys -t 4 "nload -u K eth0 wlan0 lo" enter
tmux send-keys -t 5 "sleep 8 && clear && watch -n 60 transmission-remote -l" enter
tmux send-keys -t 6 "sleep 15 && pyLoadCli" enter
tmux send-keys -t 7 "sleep 15 && clear" enter

tmux new-window -d

tmux send-keys -t 0:2 "clear" enter

tmux select-window -t 1

tmux select-pane -t 7

tmux attach
