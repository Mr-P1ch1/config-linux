#!/bin/bash

# Colores en formato hexadecimal
COLOR_INACTIVO="#FFFFFF"     # Blanco
COLOR_SEGUNDO_PLANO="#00aaff" # Azul
COLOR_ACTIVO="#B48EAD"       # Morado

# Comando para obtener el estado de los workspaces
workspaces=$(hyprctl workspaces -j)

# Verificar si el JSON es válido
if [ -z "$workspaces" ]; then
    echo "{\"text\":\"Error: JSON vacío o inválido\"}"
    exit 1
fi

# Variables para almacenar el resultado final
output=""

# Recorrer cada workspace y aplicar el color adecuado
for id in $(echo "$workspaces" | grep -oP '(?<="id":)[0-9]+'); do
    if echo "$workspaces" | grep -q "\"id\":$id,\"focused\":true"; then
        output+="%{F$COLOR_ACTIVO}󱥸 %{F-} "
    else
        output+="%{F$COLOR_SEGUNDO_PLANO}󱥸 %{F-} "
    fi
done

# Mostrar el resultado en formato JSON
echo "{\"text\":\"$output\"}"
