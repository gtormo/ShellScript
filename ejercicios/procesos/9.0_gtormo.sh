#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Ejercicio 9.0

#Realiza un shell script al que le pasaremos un nombre de usuario y nos mostrará los procesos de ese usuario.
#El formato de salida será el siguiente: comando, el pid del proceso, uid del usuario el porcentaje de cpu y
#de memoria


  #systemd          1177  1001  0.0  0.0
  #(sd-pam)         1178  1001  0.0  0.0
  #gnome-keyring-d  1184  1001  0.0  0.0
  #cinnamon-sessio  1186  1001  0.0  0.3
  #dbus-daemon      1194  1001  0.0  0.0
  #ssh-agent        1224  1001  0.0  0.0
  #at-spi-bus-laun  1228  1001  0.0  0.0
  #dbus-daemon      1233  1001  0.0  0.0
  #at-spi2-registr  1235  1001  0.0  0.0
  #cinnamon-settin  1252  1001  0.0  0.5

if [ $# -eq 1 ]
  then
    for process in $(ps -aux | grep ^$1 | tr -s ' ' '_')
      do
        echo $process
      done
else
    echo "[!] Insert one username [!]"
fi
