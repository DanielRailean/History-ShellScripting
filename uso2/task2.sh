#!/bin/bash
echo -n > system_monitor.csv
COUNTER=0
while [ $COUNTER -lt 10 ]; do
    name_of_computer=$(hostname)
    timestamp=$(date +%s)
    percent_cpu_usage_inSystemAtThisTime=$(uptime | awk '{print $10}')
    bytes_of_mem_usage_inSystemAtThisTime=$(free -tb | awk '{print $3}' | sed '$!d')
    num_bytes_transmitted=$(cat /proc/net/dev | grep "enp" | awk  '{print $10}')
    num_bytes_received=$(cat /proc/net/dev | grep "enp" | awk  '{print $2}')
    OUT="$name_of_computer,$timestamp,$percent_cpu_usage_inSystemAtThisTime,$bytes_of_mem_usage_inSystemAtThisTime,$num_bytes_transmitted,$num_bytes_received"

    echo "$OUT" >> system_monitor.csv
    let COUNTER=COUNTER+1
done