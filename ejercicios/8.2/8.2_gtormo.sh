#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 8.2

#Realiza un shell script al que le pasaremos un nombre de usuario como parámetro. Si el usuario existe
#en el sistema mostrará el menú.

#1)Modificar la passwd de "usuario"

#2)Ver el contenido del HOME de "usuario"

#3)Mostrar la ruta del HOME de "usuario"

#4)Mostrar el shell de inicio de "usuario"

#5)Mostrar todos los grupos que pertenece el usuario

#6)Mostrar el nombre completo junto con el login

#7)Salir

#Si el usuario no existe finalizará el script y avisará del error. Para obtener la información en los
#casos que se requiere se utilizará el fichero /etc/passwd y /etc/group.

. 8.2_functions.sh

user=$1

if [ $# -eq 1 ]
  then
    if cat /etc/passwd | grep -w "$user" 1>/dev/null
      then
        value=0
        createDB

        while [ $value -eq 0 ]
          do
            echo "
              [-] 1-Modify user's password     [-]
              [-] 2-View home content          [-]
              [-] 3-View user's path home      [-]
              [-] 4-View user's start shell    [-]
              [-] 5-View user's group          [-]
              [-] 6-View full name and login   [-]
              [-] 7-Exit                       [-]

              Insert one option:"
            read var

            while [ $var -lt 1 -o $var -gt 7 ]
              do
                echo -e "[!] Invalid option [!]"
                echo -e "Insert a valid option:"
                read var
              done
              case $var in
                1)
                  changePassword
                ;;
                2)
                  listHome
                ;;
                3)
                  pathHomeUser
                ;;
                4)
                  shellUser
                ;;
                5)
                  groupsUser
                ;;
                6)
                  fullNameAndLogin
                ;;
                7)
                  value=1
                ;;
              esac
          done
    else
        echo "[!] $user doesn't exist [!]"
        exit 1
    fi
else
    echo "[!] Insert one user [!]"
fi
