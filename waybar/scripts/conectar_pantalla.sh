#!/bin/bash

# Listar pantallas disponibles usando xrandr
displays=$(xrandr --query | grep " connected" | cut -d ' ' -f1)

# Usa rofi o dmenu para seleccionar una pantalla
selected_display=$(echo "$displays" | rofi -dmenu -p "Selecciona una pantalla:")

# Si selecciona una pantalla, conectarse a ella con una resolución predeterminada
if [ ! -z "$selected_display" ]; then
  xrandr --output "$selected_display" --auto
  notify-send "Conectado a la pantalla: $selected_display"
else
  notify-send "No se seleccionó ninguna pantalla"
fi
