#!/usr/bin/env bash
#Autor: nazareth
#Versión: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Descripción: funcion para conseguir el UUID
#Fecha de creación: mié 30 mar 2022 08:52:40 CET

#zona declaracion de funciones

#funcion que consigue el UUID
#salida: UUID
#entrada: -

function f_UUID {
        echo $(blkid | egrep /${!#}: | egrep -o "[a-z0-9]{8}-([a-z0-9]{4}-){3}[a-z0-9]{12}")
}

#fin zona
