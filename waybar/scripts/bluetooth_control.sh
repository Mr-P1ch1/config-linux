#!/bin/bash

# Verificar si el adaptador Bluetooth está encendido
status=$(bluetoothctl show | grep "Powered: yes")

# Verificar si algún dispositivo Bluetooth está conectado
connected=$(bluetoothctl info | grep "Connected: yes")

# Determinar el ícono y el estado según si el Bluetooth está encendido o si hay dispositivos conectados
if [ -z "$status" ]; then
    icon="󰂲"  # Bluetooth apagado
    echo "{\"text\": \"$icon\", \"tooltip\": \"Bluetooth apagado\", \"class\": \"off\"}"
elif [ -n "$connected" ]; then
    icon="󰂱"  # Bluetooth conectado
    echo "{\"text\": \"$icon\", \"tooltip\": \"Bluetooth conectado\", \"class\": \"connected\"}"
else
    icon="󰂯"  # Bluetooth encendido pero no conectado
    echo "{\"text\": \"$icon\", \"tooltip\": \"Bluetooth encendido, no conectado\", \"class\": \"on\"}"
fi
