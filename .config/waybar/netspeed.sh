#!/bin/bash
INTERFACE="wlan0"
while true; do
    LINE1=$(cat /proc/net/dev | grep $INTERFACE)
    RX1=$(echo $LINE1 | awk '{print $2}') 
    TX1=$(echo $LINE1 | awk '{print $10}')
    sleep 1
    LINE2=$(cat /proc/net/dev | grep $INTERFACE)
    RX2=$(echo $LINE2 | awk '{print $2}')
    TX2=$(echo $LINE2 | awk '{print $10}')

    DOWN=$(( (RX2 - RX1) / 1024 ))
    UP=$(( (TX2 - TX1) / 1024 ))
    echo "Down: $DOWN kB/s | Up: $UP kB/s"
done
