#!/bin/bash

#Author: Gonzalo Tormo bash
#Course: 1ºDAW

#Activity 7.3
#Realiza un SS que le pasamos como argumento 1 fichero o un directorio o lo que sea. El SScript nos dirá que es. Realiza control de errores.

  #./ssh06.sh kk

    #kk no existe

  #./ssh06.sh pep.pdf

    #pep.pdf es un fichero regular

  #./ssh06.sh

  #Necesito 1 parámetro

typeFile=(0 -d -b -c -f -g -h -k -p -S)
message=(
""
"Es un directori"
"Es un fitxer especial del bloc"
"Es un fitxer especial de caracter"
"Es un fitxer regular"
"El set-group-id esta establert"
"Es un ellac simbolic"
"El sticky-bit esta establert"
"Es un conducte amb nom"
"Es un endoll"
)

if [ $# -eq 1 ]
  then
    if [ -a $1 ]
      then
        for i in $( seq ${#typeFile[@]})
          do
              if [ ${typeFile[$i]} $1 ]
                then
                    echo "$1 ${message[$i]}"
                fi
          done
    else
        echo "$1 doesn't exist"
    fi
else
  echo "[!] Only 1 parameter [!]"
fi
