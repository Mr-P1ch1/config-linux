#!/bin/bash

# 1. Actualizar el sistema e instalar las dependencias necesarias
echo "Actualizando el sistema e instalando dependencias..."
sudo pacman -Syu --needed waybar kitty neovim zsh git wget

# 2. Clonar el repositorio de configuraciones
echo "Clonando el repositorio de configuraciones..."
git clone https://github.com/Mr-P1ch1/config-linux.git ~/config-linux

# 3. Copiar las configuraciones a sus respectivas ubicaciones
echo "Copiando configuraciones a los directorios correspondientes..."

# Waybar
cp -r ~/config-linux/waybar ~/.config/waybar

# Kitty
cp -r ~/config-linux/kitty ~/.config/kitty

# Neovim
cp -r ~/config-linux/nvim ~/.config/nvim

# Wofi
cp -r ~/config-linux/wofi ~/.config/wofi

# Archivos de Zsh
cp ~/config-linux/.bashrc ~/
cp ~/config-linux/.zshrc ~/
cp ~/config-linux/.p10k.zsh ~/

# Fondos de pantalla
cp -r ~/config-linux/fondos ~/Imágenes/

# Scripts de rotación de fondos
mkdir -p ~/.config/hypr/scripts
cp ~/config-linux/scripts/rotate_wallpapers.sh ~/.config/hypr/scripts/

# 4. Configurar Zsh como la terminal predeterminada
echo "Configurando Zsh como la terminal predeterminada..."
chsh -s $(which zsh)

# 5. Finalización
echo "Instalación y configuración completada. Reinicia tu terminal para aplicar los cambios."

