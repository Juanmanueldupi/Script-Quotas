#!/usr/bin/env bash


#Descripción: Modifica el fichero fstab

#Zona de declaración de variables

#Fin zona

#Zona de declaración de funciones

function f_modifstab { 

echo "UUID=$1 $2 ext4 defaults,usrquota,grpquota 0 0" >> /etc/fstab

}

#Argumentos ded la función: $1 = UUID  $2 = /QUOTA
#Valor devuelto por la función: Introducir información del disco en /etc/fstab
