#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.6

#Realiza un SScript al que le pasaremos un número de ficheros indefinido como argumento y nos realizará una copia de seguridad de estos ficheros en una carpeta de nombre backups que estará en nuestro HOME.

  #Example: bash ss05.sh examen.pdf apunts.odt
  #Copia de seguretat de examen.pdf a backups
  #Copia de seguretat de apunts.odt a backups

LOG="/home/$USER/backupLog.log"
BACKUP="/home/$USER/backup.tar.gz"
listFiles=("")

if [ $# -ge 1 ]
  then
    for file in $@
      do
        if [ -a $file ] 2>/dev/null
          then
            #If $file exist then add it to array
            listFiles+=("$file")
            echo "Backup from $file to $BACKUP"
        else
            echo "[!] $file does not exist [!]"
            echo "$file have been ignored to compress"
        fi
      done

      echo "Compressing..."
      sleep 2
      
      if tar cfz $BACKUP ${listFiles[@]} 1>/dev/null
        then
          echo "$(date)--->Succesful compress" >> $LOG
      else
          echo "$(date)--->[!] ERROR compressing [!]" >> $LOG
      fi
else
    echo "[!] Insert one o more parameters [!]"
fi
