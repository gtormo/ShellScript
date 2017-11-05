#!/bin/bash

#Author: Gonzalo Tormo bash
#Course: 1ºDAW

#Activity 7.7

#Juego del número mágico. Realiza un SScript que simulará un juego del número mágico. El usuario deberá de adivinar el numero,
#si adivina el número mostrará un aviso y termina el programa. Sólo tenemos 3 intentos si al tercer intento no acierta finaliza
#script, avisando.

intentos=3
magicNum=$(( ( RANDOM % 10 )  + 1 ))

while [ $intentos -ne 0 ]
  do
    echo "NÚMERO MÁGICO

          Pista: El número se encuentra entre 0 y 10.
          Tienes $intentos intentos

          Adivina el número:
    "
    read var

    if [ $var -eq $magicNum ]
      then
        echo "Enhorabuena. Has acertado!"
        intentos=0
    else
        echo "No has acertado..."
        intentos=$((intentos-1))

        if [ $intentos -eq 0 ]
          then
            echo "Fin del juego. Se acabaron los intentos
                  Bye!"
        fi
    fi
  done
