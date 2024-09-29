#!/bin/bash

# Obtener el brillo actual
CURRENT_BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$(($CURRENT_BRIGHTNESS * 100 / $MAX_BRIGHTNESS))

# Abrir la barra deslizante con zenity y actualizar el brillo en tiempo real
zenity --scale --text="Ajustar Brillo" --value=$PERCENTAGE --min-value=0 --max-value=100 --hide-value --step 1 \
  --print-partial |
while read BRIGHTNESS
do
    brightnessctl set ${BRIGHTNESS}%
done
