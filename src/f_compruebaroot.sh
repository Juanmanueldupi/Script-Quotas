#!/usr/bin/env bash


#Descripción: Comprueba si eres root o no

#Zona de declaración de variables
#No hay variables
#Fin zona

#Zona de declaración de funciones

function f_compruebaroot {
if ! [ "$(id -u)" = 0 ]; then
    echo "No eres root!"
    exit 
fi
}

#Argumentos de la función: no tiene
#Valor devuelto por la función: 0. Es root 1. No es root
