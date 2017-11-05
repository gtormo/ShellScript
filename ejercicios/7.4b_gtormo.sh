#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.4b
#ss10.sh Realiza un SS que pedirá al usuario un valor y este nos mostrará los 10 números siguientes a este. Realiza control de errores.

echo "Insert one number:"
read var

if [ $var ]
  then
    for i in $(seq 10)
      do
        var=$((var+1))
        echo $var
      done
else
    echo "[!] Insert one number [!]"
fi
