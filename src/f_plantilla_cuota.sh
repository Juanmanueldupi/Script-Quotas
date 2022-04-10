#!/bin/bash
function f_plantilla_cuota {
#Comprueba si eres root
if ! [ $(id -u) = 0 ]; then
	echo "No eres root"
	exit
	else
	echo "Eres root"
fi
#Preguntar  el nombre del usuario y si queremos crearlo.
read -p  "Nombre del usuario que deseas crear: " USER
read -p  "Contraseña del usuario:  "  CON
read -p "¿Deseas continuar con la operacón? S/N: " RESPUESTA
if [[ $RESPUESTA  == S ]] || [[ $RESPUESTA == s ]]; then
	echo "En curso..."
	sleep 2s
	else
	exit
fi
# Comprueba el usuario y si no esta en el sistema lo crea.
if id -u $USER 2> /dev/null; then
	echo " El usuario indicado existe en el sistema "
	else
	echo "Creando usuario..."
	useradd $USER -p $CON
	echo "¡Usuario creado con exito!"
fi
}

