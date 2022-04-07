#!/usr/bin/env bash


#Descripción: Modifica el fichero fstab

#Zona de declaración de variables

#Fin zona

#Zona de declaración de funciones

function f_modifstab { $uuid,$QUOTA
if grep -q '':
    then 
    echo "uuid=($uuid) $QUOTA ext4 defaults,usrquota,grpquota 0 0" >> /etc/fstab


fi
}

#Argumentos ded la función: 
#Valor devuelto por la función: 