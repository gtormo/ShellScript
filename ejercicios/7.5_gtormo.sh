#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.5
#Mini Shell. Realiza un SScript que realice las siguientes opciones:

#1)Crear un directorio

#2)Crear un fichero

#3)Listar el contenido de un directorio

#4)Ver el espacio en disco

#5)Salir

#Para las opciones 1, 2 y 3 el script pedirá para cada opción que el usuario introduzca los datos. Para la opción 4 utilizaremos el comando df -h

. 7.5_functions_gtormo.sh
value=0



while [ $value -eq 0 ]
  do
    echo "
      [-] 1-Create a directory  [-]
      [-] 2-Create a file       [-]
      [-] 3-List a directory    [-]
      [-] 4-Show disk space     [-]
      [-] 5-Exit                [-]

      Insert one option:"
    read var

    while [ $var -lt 1 -o $var -gt 5 ]
      do
        echo -e "[!] Invalid option [!]"
        echo -e "Insert a valid option:"
        read var
      done
      case $var in
        1)
          createDirectory
        ;;
        2)
          createFile
        ;;
        3)
          listDirectory
        ;;
        4)
          echo "show disk space"
        ;;
        5)
          value=1
        ;;
      esac
  done
