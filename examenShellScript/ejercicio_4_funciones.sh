#!/bin/bash

# Declaramos la variable que contendra el destino del fichero que actuará como base de datos de los contactos
db="db_contact.txt"

# Declaramos un array para la informacion de los contactos y otro para los mensajes de creacion del contacto
declare -a contacts
messages=(
""
"Inserte el nombre:"
"Inserte los apellidos(los dos apellidos):"
"Inserte el teléfono:"
"Inserte la edad:"
"Inserte el DNI:"
)

function createContact() {
  unset 'contacts[@]' # Para vaciar el array
  values=${#messages[@]}
  arraySize=$(($values-1))

  for position in $(seq $arraySize)
    do
      echo ${messages[$position]}
      read field
      contacts+=("$field")
    done

  # El array contacts ya tiene todos los campos llenos ahora solo queda pasarselo a la base de datos:
  echo ${contacts[@]} >> $db
}

function searchContact() {
  echo ${messages[1]}
  read username

  # Pedimos el nombre de contacto a listar y primero vemos si existe en la base de datos

  if cat $db | grep -w ^"$username" 1>/dev/null
    then
      echo "Usuario encontrado!"

      nameSurnames=$(cat $db | grep -w ^"$username" | cut -d " " -f 1-3)
      phone=$(cat $db | grep -w ^"$username" | cut -d " " -f 4)
      age=$(cat $db | grep -w ^"$username" | cut -d " " -f 5)
      dni=$(cat $db | grep -w ^"$username" | cut -d " " -f 6)

      echo "Nombre y apellidos: $nameSurnames"
      echo "Teléfono: $phone"
      echo "Edad: $age años"
      echo "Dni: $dni"
  else
    echo "[!] $username no existe en la agenda de contactos [!]"
  fi
}

function listContacts() {
  #Sacamos los nombre de cada linea de la base de datos y a su vez por cada linea recorremos esa linea en busca de la edad
  if cat $db 1>/dev/null
    then
      for username in $(cat $db | cut -d " " -f 1)
        do
          for subfield in $(cat $db | grep -w ^"$username" | cut -d " " -f 5)
            do
              echo "Usuario: $username, Edad: $subfield"
            done
        done
  else
    echo "[!] No existe ningún usuario [!]"
  fi
}

function removeContact() {
  echo ${messages[1]}
  read username

  if cat $db | grep -w ^"$username" 1>/dev/null
    then
      sed -i.bak '/'$username'/d' $db
  else
    echo "[!] $username no existe en la agenda de contactos [!]"
  fi
}

function orderContacts() {
  if cat $db 1>/dev/null
    then
      cat $db | cut -d " " -f 1,5 | sort -t " " -k2nr
  else
    echo "[!] No existe ningún usuario [!]"
  fi
}

function makeBackup() {
  echo "Inserte el nombre del fichero de copia:"
  read backup

  if [ -f $backup ]
    then
      echo "[!] $backup ya existe [!]"
  else
      cat $db > $backup
      echo "Agenda copiada exitósamente!"
  fi
}
