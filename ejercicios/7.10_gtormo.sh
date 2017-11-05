#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.10

#Escribir un script shell que para cada argumento que reciba realice una de las siguientes operaciones:

    #si es un directorio ha de listar los ficheros que contiene,
    #si es un fichero regular lo tiene que mostrar por pantalla,

    #en otro caso, que indique que no es ni un fichero ni un directorio.

#Realiza control de errores.

function list() {
  ls -l $1
}

function open(){
  less $1
}

if [ $# -ne 0 ]
  then
    for file in $@
      do
          if [ -a $file ]
            then
              if [ -d $file ]
                then
                  list $file
                  sleep 2
              elif [ -f $file ]
                then
                  open $file
              else
                echo "$file does not a file and a directory."
              fi
          else
            echo "[!] $file does not exist [!]"
          fi
      done
else
    echo "[!] Insert one o more parameters [!]"
fi
