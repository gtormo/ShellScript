#!/bin/bash

# Author: Gonzalo Tormo Bas
# Course: 1ºDAW

# EJERCICIO 4

# Vamos a realizar la gestión de una agenda de contactos. La agenda estará en un fichero de texto y el script
# realizará las siguientes opciones sobre la agenda.

#       1.Introducir contacto
#       2.Buscar contacto
#       3.Listar contactos y edad
#       4.Borrar contacto
#       5.Listar contactos ordenados de forma descendente por edad
#       6.Realizar copia de seguridad de la agenda
#       0.Salir

# Formato de edad "00"
# Formato de la salida de buscar contacto:
#           Nombre y Apellidos: Juan Garcia
#           Teléfono: 962914089
#           Edad: 23 años
#           DNI: 70897870H

# Para "buscar contacto" buscaremos por el nombre y el script pedirá el nombre.
# "Listar contactos" mostrará todos los contactos con su edad.
# Para "borrar contacto" el sistema nos pedirá el nombre que queremos borrar.
# Para la opción 6 debemos tener/guardar un historial de la agenda.

. ejercicio_4_funciones.sh # Para importar las funciones de otro fichero .sh

value=0

while [ $value -eq 0 ]
  do
    echo "AGENDA DE CONTACTOS"
    echo ""
    echo "
    1.Introducir contacto
    2.Buscar contacto
    3.Listar contactos y edades
    4.Borrar contacto
    5.Listar contactos ordenados de forma descendente por edad
    6.Realizar copia de seguridad de la agenda
    0.Salir
    "
    read option

    while [ $option -gt 6 ]
      do
        echo "[!] Inserta una opción válida [!]"
        read option
      done

      case $option in
        1)
          createContact
        ;;
        2)
          searchContact
        ;;
        3)
          listContacts
        ;;
        4)
          removeContact
        ;;
        5)
          orderContacts
        ;;
        6)
          makeBackup
        ;;
        0)
          echo "Saliendo"
          value=1
        ;;
      esac
  done
