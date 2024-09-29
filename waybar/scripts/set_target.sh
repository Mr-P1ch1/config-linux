#!/bin/bash

target_file="/home/mr_p1ch1/.config/bin/target"

if [ -f $target_file ] && [ -s $target_file ]; then
    ip_address=$(awk '{print $1}' $target_file)
    machine_name=$(awk '{print $2}' $target_file)
    last_target_file="/tmp/last_target"
    if [ ! -f "$last_target_file" ] || [ "$(cat $last_target_file)" != "$ip_address $machine_name" ]; then
        echo "$ip_address $machine_name" > "$last_target_file"
    fi
    echo "{\"text\": \"󰓾  $ip_address - $machine_name\", \"tooltip\": \"Target: $machine_name\nIP: $ip_address\"}"
else
    if [ -f "/tmp/last_target" ]; then
        rm /tmp/last_target
    fi
    echo "{\"text\": \"  No target\", \"tooltip\": \"No target set\"}"
fi
