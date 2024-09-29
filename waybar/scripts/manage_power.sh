#!/bin/bash

# Definir las opciones de energía
options="Suspender\nHibernar\nApagar\nReiniciar"

# Mostrar el menú usando wofi
selection=$(echo -e $options | wofi --dmenu --width 300 --height 200 --prompt "Menú de Energía")

# Ejecutar la acción seleccionada
case $selection in
  "Suspender")
    systemctl suspend
    ;;
  "Hibernar")
    systemctl hibernate
    ;;
  "Apagar")
    systemctl poweroff
    ;;
  "Reiniciar")
    systemctl reboot
    ;;
  *)
    echo "No se seleccionó ninguna acción."
    ;;
esac
