#!/bin/bash

# Author: Gonzalo Tormo Bas
# Course: 1ºDAW

# EJERCICIO 3 - Puntuación(1.5) - Pista(comando `who`)

# Realiza un script que muestre el número de procesos del usuario conectado al sistema en ese momento,
# en el caso de tener más de uno elegir uno al azar.
# También nos mostrará información sobre ese usuario: la fecha, la hora y desde donde esta conectado.

declare -a user

#### FUNCTIONS
function selectUser() {
  # De forma random vamos a escoger un usuario conectado en el sistema al azar

  # Primero vamos a ver cuantos usuarios hay conectados en el sistema. De esta forma
  # generaremos el usuario random dentro de un numero comprendido en la cantidad de usuarios conectados

  random=$(( ( RANDOM % $(who | wc -l) )  + 1 ))

  # La variable random nos devuelve un número random, es decir escogeremos el número de linea gracias a esta variable,
  # cuya linea contendra el nombre de usuario y por lo tanto podremos extraer el usuario de forma random.
  # Tambien interesa guardar los campos de esa linea: fecha, hora y origen de conexion

  # Con el seguiente bucle vamos a ir palabra por palabra de esa linea y la almacenaremos en un array con sus respectivas posiciones


  for field in $(who | awk 'NR=='$random | tr -s ' ' ' ')
    do
      user+=("$field")
    done
}

function countProcess() {
  # A continuación vamos a contar los procesos que tiene ese usuario.
  # El nombre de usuario lo tenemos guardado en la posicion 0 del array.
  # Filtraremos la busqueda de los procesos por ese campo del array y por último contaremos los procesos

  process=$(ps -eo user | grep -w "${user[0]}" | wc -l)
}

#### MAIN

# Aqui es donde se ejecuta el script, llamando a las funciones creadas anteriormente

selectUser
countProcess

# Ahora vamos a generar los datos de salida de pantalla:
echo "Usuario: ${user[0]}"
echo "Número de procesos: $process"
echo "Fecha de conexión: ${user[2]}"
echo "Hora de conexión: ${user[3]}"
echo "Origen de conexión: $(echo ${user[4]} | cut -d "(" -f 2 | cut -d ")" -f 1)"
