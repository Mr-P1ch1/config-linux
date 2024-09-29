#!/bin/bash

RAM=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
CPU=$(grep "cpu " /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')
TEMP=$(sensors | grep "Package id 0:" | awk '{print $4}')

echo -e "RAM: $RAM\nCPU: $CPU\nTemp: $TEMP"
