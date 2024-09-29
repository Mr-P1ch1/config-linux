#!/bin/bash

# Inicializar el volumen actual
CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -n1 | tr -d '%')

# Abrir la barra deslizante con zenity y actualizar el volumen en tiempo real
zenity --scale --text="Ajustar Volumen" --value=$CURRENT_VOLUME --min-value=0 --max-value=100 --hide-value --step 1 \
  --print-partial |
while read VOLUME
do
    pactl set-sink-volume @DEFAULT_SINK@ ${VOLUME}%
done
