#!/usr/bin/env python3
import json
import subprocess

def get_media_info():
    # Obtener el estado del reproductor (Playing, Paused, Stopped)
    player_status = subprocess.getoutput("playerctl status").strip()
    
    if player_status == "Playing":
        icon = ""  # Icono de Play
    elif player_status == "Paused":
        icon = ""  # Icono de Pausa
    else:
        icon = ""  # Icono de Stop
    
    # Obtener el título de la canción
    title = subprocess.getoutput("playerctl metadata title").strip()
    artist = subprocess.getoutput("playerctl metadata artist").strip()
    album = subprocess.getoutput("playerctl metadata album").strip()

    # Formatear la información de la canción
    media_info = f"{artist} - {title} ({album})"
    return {"icon": icon, "title": media_info}

if __name__ == "__main__":
    media_info = get_media_info()
    print(json.dumps(media_info))
