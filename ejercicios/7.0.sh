#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.0
#Realiza un SS que le pasamos 2 valores (texto) como parámetro y nos mostrará si son iguales o diferentes

	#Ejemplo:
	#./ssh01.sh Pepe pepe
	# Pepe es diferente de pepe

#Realiza control de errores del ejercicio, mostrando un aviso si faltan/sobran parámetros y avisando al usuario. Si faltan/sobran parámetros finalizará el script.

if [ $# -eq 2 ]
 then
	if [ $1 == $2 ]
	 then
		echo "$1 and $2 are equal."
	 else
		echo "$1 and $2 are not equal."
	fi
 else
	echo "ERROR: Only allowed 2 parameters!"
fi
