#!/bin/bash

CHOICE=$(echo -e "Apagar\nReiniciar\nSuspender\nCerrar Sesión" | wofi --show dmenu --prompt "Sistema:")

case "$CHOICE" in
  Apagar)
    systemctl poweroff
    ;;
  Reiniciar)
    systemctl reboot
    ;;
  Suspender)
    systemctl suspend
    ;;
  "Cerrar Sesión")
    hyprctl dispatch exit
    ;;
esac
