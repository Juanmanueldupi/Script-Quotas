#!/usr/bin/env bash
#Autor: nazareth
#Versión: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Descripción: funcion de comprobacion si existe el directorio /QUOTA
#Fecha de creación: mar 29 mar 2022 10:30:58 CET

#zona declaracion de funciones

#funcion que comprueba si existe el directorio
#salida: mensajes de confirmacion
#entrada: -

function f_existedirectorio {
        if [ -d "/QUOTA" ]; then
        echo "El directorio ya existe"
        else
        echo "No existe el directorio /QUOTA" 
        echo "Creando directorio ..." && sleep 2s && echo $(mkdir /QUOTA) && echo "Directorio creado"
        fi
}


#fin zona
