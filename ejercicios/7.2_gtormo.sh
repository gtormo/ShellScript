#!/bin/bash

#Author: Gonzalo Tormo Bas
#Course: 1ºDAW

#Activity 7.2
#Realiza un SS que pedirá al usuario 2 números. El script realizará la suma/resta/producto y división entre estos dos números según la opción del usuario. Realiza control de errores.

	#./ss72.sh
	#Dame dos numeros?
		#5 5
	#Que operacioón realizamos?
		#+
	#El total de 5 + 5 = 10

value=0
operation=( + - x / )

#while [ $value -eq 0 ]
# do
	echo "Insert 2 numbers:"
	read -a number
	
	while [ ${#number[@]} -ne 2 ]
	 do
	 	echo "[!] Invalid numbers [!]"
		echo "Insert 2 numbers:"
		read -a number
	 done

	echo "Choose the operation (+, -, x, /):"
	read symbol
	
	op=1

	while [ $op -eq 1 ]
	 do
		 	count=0
			while [ $count -lt ${#operation[@]} ]
			 do
				 echo "COmprobando con contador..."
				if [ ${operation[$count]} == $symbol ]
				 then
				 	count=${#operation[@]}
					echo "Is valid!"
					op=0
					result=1
				 else
					 count=$((count+1))
					 result=0
				 fi
			 done

			 if [ $result -eq 0 ]
			  then
				echo "[!] Invalid operation [!]"
				echo "Insert a valid operation:"
				read symbol
			fi
	 done

	#echo "El numero 1 es: ${number[0]}"
	#echo "EL numero 2 es: ${number[1]}"
	
	#echo "Los simbolos disponibles son: ${operation[*]}"

	#echo "Insert operation:"
	#read value
	
# done
