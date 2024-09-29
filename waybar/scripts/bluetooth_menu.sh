#!/bin/bash

# Verificar si el Bluetooth está encendido
status=$(bluetoothctl show | grep "Powered: yes")

if [ -z "$status" ]; then
    # Si el Bluetooth está apagado, encenderlo
    bluetoothctl power on
else
    # Mostrar un menú con los dispositivos emparejados
    devices=$(bluetoothctl devices | awk '{print $2 " - " $3 " " $4}')
    chosen_device=$(echo "$devices" | wofi --dmenu -p "Seleccionar dispositivo")

    if [ -n "$chosen_device" ]; then
        device_mac=$(echo "$chosen_device" | awk '{print $1}')
        connection_status=$(bluetoothctl info "$device_mac" | grep "Connected: yes")

        # Conectar o desconectar según el estado actual
        if [ -z "$connection_status" ]; then
            bluetoothctl connect "$device_mac"
        else
            bluetoothctl disconnect "$device_mac"
        fi
    fi
fi
