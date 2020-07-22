#!/bin/bash
timeout=1

gpio -g mode 4 output
#gpio -g mode 17 output
#gpio -g mode 22 output

gpio -g write 4 1
sleep 0.1
gpio -g write 4 0

#for i in {0..4}
#do
#    gpio -g write 4 1
#    sleep $timeout
#    gpio -g write 4 0
#    sleep $timeout
#done
