#!/bin/bash

function createFile() {
  echo "Inserte el nombre del fichero:"
  read file

  if [ -f /tmp/$file ]
    then
      echo "[!] /tmp/$file ya existe [!]"
  else
    if touch /tmp/$file 1>/dev/null
      then
        echo "/tmp/$file creado exitósamente"
    else
        echo "[!] Error al crear /tmp/$file [!]"
    fi
  fi
}

function showHomeAndShell() {
  if cat /etc/passwd | grep -w ^"root" 1>/dev/null
    then
      echo "HOME: $(cat /etc/passwd | grep -w ^"root" | cut -d ":" -f 6)"
      echo "SHELL: $(cat /etc/passwd | grep -w ^"root" | cut -d ":" -f 7)"
  else
      echo "[!] No se encontro al usuario root en el sistema [!]"
  fi
}

function createDirectory() {
  echo "Inserte el nombre del directorio:"
  read directory

  if [ -d /tmp/$directory ]
    then
      echo "[!] /tmp/$directory ya existe [!]"
  else
    if mkdir -p /tmp/$directory 1>/dev/null
      then
        echo "/tmp/$directory creado exitósamente"
    else
        echo "[!] Error al crear /tmp/$directory [!]"
    fi
  fi
}

function countHomeFiles() {
  echo "Numero de ficheros de $HOME: $(find $HOME -mindepth 1 -maxdepth 1 -type f | wc -l)"
}

function countHomeDirectories() {
  echo "Numero de directorios de $HOME: $(find $HOME -mindepth 1 -maxdepth 1 -type d | wc -l)"
}

function listFilesSize() {
  echo "Inserte el nombre del directorio:"
  read directory

  if [ -d $directory ]
    then
      find $directory -mindepth 1 -maxdepth 1 -type f -size +1k
  else
      echo "[!] $directory no existe [!]"
  fi
}

function listAndDropEmptyDirectories() {
  echo "Inserte el nombre del directorio:"
  read directory

  if [ -d $directory ]
    then
      echo "Directorios vacios:"
      echo ""
      find $directory -type d -empty

      echo "Eliminando directorios vacios de $directory ..."
      find $directory -type d -empty -exec rmdir {} \; 2>/dev/null
  else
      echo "[!] $directory no existe [!]"
  fi
}

function showVariables() {
  echo "Variables de entorno:"
  echo ""
  env | cut -d "=" -f 1
}
