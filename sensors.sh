#!/bin/bash
#runs sensors on repeat to act as a running CPU temperature sensor when I need it

while true
do
    clear
    echo "==========================================="
    sensors
    sleep 5
done
