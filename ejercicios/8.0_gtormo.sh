#!/bin/bash

#Author: Gonzalo Tormo bash
#Course: 1ºDAW

#Activity 8.0

#Realiza un Shell Script para realizar copias de seguridad de las carpetas con nuestros trabajos de cada uno de los módulos
#de 1º de DAW. Realizaremos todos los días una copia de seguridad y guardaremos un historial de 3 días por lo que pueda pasar
#eliminando las más vieja y conservando la más nueva.
#El SS debe contemplar poder modificar varios parámetros como destino y
#origen de las copias, así como la cantidad de copias de cada fichero que almacenaremos.

#El script incorporará un sistema de log para almacenar todo lo ocurrido de forma que el usuario con solo consultar el fichero
#de log pueda observar si la copia se realizar de forma correcta o hay errores etc.

LOG="/home/$USER/backup-log.log"

#Run script example: ./8.0_gtormo 2 ~/backups /etc/passwd /etc/shadow ...

#Transspasing $@ to parameters's array
  for parameter in $@
    do
      parameters+=("$parameter")
    done

BACKUP="${parameters[1]}" # Destination PATH to copy file's origin
quantity=${parameters[0]} # Quantity of copies from file's origin
position=2                # Position where start the first origin file on parameters's array
error="[!]"
info="[i]"

function writeLog() {
  echo "$1 $(date) ---> $2 $1" >> $LOG
  # Arreglar los valores posicionales ya que pilla los posicionales del script de arranque
}

function checkBackups() {
  echo " " # Si existen los 3 backups hay que eliminar el mas antiguo
          # atarves del comando find
}

function makeBackup() {
  while [ $position -lt ${#parameters[@]} ]
    do
      if [ -a ${parameters[$position]} ]
        then
          filesToCompress+=("${parameters[$position]}") #To extract only origin files to do the backup
      else
          writeLog $error "${parameters[$position]} doesn't exist, it had been ignored"
      fi

      position=$((position+1))
    done
    for i in $(seq $quantity)
      do
        if tar cfz "$BACKUP/backup1-$i.tar.gz" ${filesToCompress[@]} 2>/dev/null
          then
            writeLog $info "${filesToCompress[@]} had been copied to $BACKUP/backup1-$i.tar.gz"
        else
            writeLog $error "ERROR copying ${filesToCompress[@]} to $BACKUP/backup1-$i.tar.gz"
        fi
      done
}


if [ -d $BACKUP ]
  then
    makeBackup
else
    if mkdir $BACKUP 2>/dev/null
      then
        writeLog $info "$BACKUP created"
    else
        writeLog $error "ERROR creating $BACKUP"
    fi
fi
