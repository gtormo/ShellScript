#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.8

#Realiza un SScript que permita ejecutar las siguientes opciones:

  #MENÚ

  #1.- Crea un usuario

  #2.- Borrar usuario

  #3.- Cambiar contraseña de un usuario

  #4.- Cambiar el shell de un usuario

  #5.- Mostrar todos los usuarios del sistema

  #6.- Mostrar información de un usuario

  #7.- Salir

. 7.8_functions.sh

value=0

while [ $value -eq 0 ]
  do
    echo "
      [-] 1-Create user               [-]
      [-] 2-Remove user               [-]
      [-] 3-Change user's password    [-]
      [-] 4-Change user's shell       [-]
      [-] 5-Show all users            [-]
      [-] 6-Show user's information   [-]
      [-] 7-Exit                      [-]

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
          createUser
        ;;
        2)
          removeUser
        ;;
        3)
          changePassword
        ;;
        4)
          changeShell
        ;;
        5)
          listUsers
        ;;
        6)
          listInfo
        ;;
        7)
          value=1
        ;;
      esac
  done
