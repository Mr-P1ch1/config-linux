#!/bin/bash

# Verificar el estado actual del Bluetooth
status=$(bluetoothctl show | grep "Powered: yes")

# Si el Bluetooth está apagado, encenderlo
if [ -z "$status" ]; then
    bluetoothctl power on
    notify-send "Bluetooth" "Bluetooth encendido"
else
    # Si el Bluetooth está encendido, listar dispositivos y conectar/desconectar
    devices=$(bluetoothctl devices | awk '{print $2 " - " $3 " " $4 " " $5}')

    if [ -z "$devices" ]; then
        notify-send "Bluetooth" "No hay dispositivos disponibles"
    else
        chosen_device=$(echo "$devices" | wofi --dmenu -p "Seleccionar dispositivo")
        if [ -n "$chosen_device" ]; then
            device_mac=$(echo "$chosen_device" | awk '{print $1}')
            connection_status=$(bluetoothctl info "$device_mac" | grep "Connected: yes")
            if [ -z "$connection_status" ]; then
                bluetoothctl connect "$device_mac"
                notify-send "Bluetooth" "Conectado a $chosen_device"
            else
                bluetoothctl disconnect "$device_mac"
                notify-send "Bluetooth" "Desconectado de $chosen_device"
            fi
        fi
    fi
fi
