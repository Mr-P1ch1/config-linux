#!/bin/bash

# Ruta al archivo donde se almacena el objetivo actual
TARGET_FILE="$HOME/.config/bin/target"

# Obtener los valores actuales si existen
if [ -f "$TARGET_FILE" ] && [ -s "$TARGET_FILE" ]; then
    CURRENT_IP=$(awk '{print $1}' "$TARGET_FILE")
    CURRENT_NAME=$(awk '{print $2}' "$TARGET_FILE")
else
    CURRENT_IP=""
    CURRENT_NAME=""
fi

# Obtener la IP/URL y el nombre del objetivo usando zenity
NEW_IP=$(zenity --entry --title="Set Target" --text="Introduce la IP o URL del objetivo actual:" --entry-text="$CURRENT_IP")
NEW_NAME=$(zenity --entry --title="Set Target" --text="Introduce el nombre del objetivo:" --entry-text="$CURRENT_NAME")

# Comprobar si se han introducido valores
if [ -n "$NEW_IP" ] && [ -n "$NEW_NAME" ]; then
    echo "$NEW_IP $NEW_NAME" > "$TARGET_FILE"
elif [ -z "$NEW_IP" ] && [ -z "$NEW_NAME" ]; then
    zenity --question --text="¿Quieres eliminar el objetivo actual?"
    if [ $? -eq 0 ]; then
        rm -f "$TARGET_FILE"
    fi
fi
