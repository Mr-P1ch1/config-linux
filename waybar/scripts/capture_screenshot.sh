#!/bin/bash

# Capturar pantalla con selección de área y guardar la imagen
FILE_PATH=~/Imágenes/captura_$(date +'%Y-%m-%d_%H-%M-%S').png
grim -g "$(slurp)" $FILE_PATH

# Copiar la captura al portapapeles
cat $FILE_PATH | xclip -selection clipboard -t image/png

# Mostrar una notificación para indicar que se ha guardado la captura y copiado al portapapeles
notify-send "Captura de Pantalla" "Captura guardada en ~/Imágenes y copiada al portapapeles"
