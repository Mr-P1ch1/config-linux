#!/bin/bash

# Obtén el estado del reproductor
status=$(playerctl status 2>/dev/null)

# Verifica si playerctl devolvió un estado
if [ -z "$status" ]; then
    icon="  "
    title="No media playing"
    artist=""
else
    # Obtén los metadatos del reproductor
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)

    # Si no se obtuvieron metadatos, asignar valores por defecto
    if [ -z "$title" ]; then
        title="Unknown Title"
    fi
    if [ -z "$artist" ]; then
        artist="Unknown Artist"
    fi

    # Limitar la longitud del título a 40 caracteres
    if [ ${#title} -gt 40 ]; then
        title="${title:0:37}..."
    fi

    # Formato de salida basado en el estado
    case "$status" in
        "Playing")
            icon="  "
            ;;
        "Paused")
            icon="  "
            ;;
        "Stopped" | *)
            icon="  "
            title="No media playing"
            artist=""
            ;;
    esac
fi

# Salida en formato JSON para Waybar
echo "{\"text\": \"$icon $title\", \"tooltip\": \"$artist - $title\"}"
