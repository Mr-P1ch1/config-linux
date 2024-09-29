#!/bin/bash

IFACE=$(ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
last_state_file="/tmp/vpn_last_state"

if [ "$IFACE" = "tun0" ]; then
    ip=$(ip -f inet addr show tun0 | grep -Po 'inet \K[\d.]+')
    current_state="connected"
    if [ ! -f "$last_state_file" ] || [ "$(cat $last_state_file)" != "$current_state" ]; then
        echo "$current_state" > "$last_state_file"
    fi
    echo "{\"text\": \"󰖂  $ip\", \"tooltip\": \"Connected to VPN\nIP: $ip\"}"
else
    current_state="disconnected"
    if [ ! -f "$last_state_file" ] || [ "$(cat $last_state_file)" != "$current_state" ]; then
        echo "$current_state" > "$last_state_file"
    fi
    echo "{\"text\": \"  Disconnected\", \"tooltip\": \"No VPN connection\"}"
fi
