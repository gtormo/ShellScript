#!/bin/bash

. ejercicio_5_funciones.sh

value=0

while [ $value -eq 0 ]
  do
    echo "
    1.Crear un fichero en /tmp
    2.Mostrar la ruta del home y el shell de inicio del usuario root
    3.Crear una carpeta /tmp
    4.Contar y mostrar el numero de ficheros del directorio HOME
    5.Contar y mostrar el numero de directorios del directorio HOME
    6.Mostrar todos los ficheros que ocupen mas de 1 kbyte de un directorio especificado
    7.Mostrar y borrar todos los directorios vacios de un directorio especificado
    8.Mostrar las variables de entorno
    0.Salir
    "
    read option

    while [ $option -gt 8 ]
      do
        echo "[!] Inserta una opción válida [!]"
        read option
      done

      case $option in
        1)
          createFile
        ;;
        2)
          showHomeAndShell
        ;;
        3)
          createDirectory
        ;;
        4)
          countHomeFiles
        ;;
        5)
          countHomeDirectories
        ;;
        6)
          listFilesSize
        ;;
        7)
          listAndDropEmptyDirectories
        ;;
        8)
          showVariables
        ;;
        0)
          echo "Saliendo"
          value=1
        ;;
      esac
  done
