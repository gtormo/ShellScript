#!/bin/bash

#Author: Gonzalo Tormo
#Course: 1ºDAW

#Activity 7.1
#Realiza un SS que nos mostrará los parámetros que le pasamos. Como máximo le podemos pasar 3 parámetros.

	#Ejemplo1
		#ssh03.sh A B

		#El parámetro 1 es A

		#El parámetro 2 es B

	#Ejemplo2
		#ssh03.sh

		#No hay parámetros

	#Ejemplo3

		#ssh03.sh A

		#El parámetro 1 es A

if [[ $# -le 3  &&  $# -ge 1 ]]
 then
	count=1

	for i in $@
	 do
		echo "The parameter $count is: $i."
		count=$((count+1))
	 done	

elif [ $# -eq 0 ]
  then
  	echo "There haven't got any parameter."

else
	echo "ERROR: Maximun 3 parameters!"
fi
