#!/usr/bin/env bash
#Autor: nazareth
#Versión: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Descripción: funcion de comprobacion si existe el directorio /QUOTA
#Fecha de creación: mar 29 mar 2022 10:30:58 CET
#Fecha de modificación:

#zona de declaracion de variables

#fin zona


#zona declaracion de funciones

#funcion que comprueba si existe el directorio
#salida: 0 si existe, 1 si no existe
#entrada: -

function f_existdir {
        if [ -d "/QUOTA" ]; then
        return 0
        else
        return 1
        fi
}

#fin zona

f_existdir
echo $?
