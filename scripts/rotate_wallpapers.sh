#!/bin/bash
while true; do
    swaybg -i "$(find ~/Imágenes/fondos/ -type f | shuf -n 1)" -m fill
    sleep 900
done
