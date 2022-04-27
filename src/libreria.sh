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
#!/usr/bin/env bash
#Autor: Antonio Marchán
#Version: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Fecha de creación: mar 29 mar 2022 10:26:54 CEST
#Fecha de modificación:
#Desripción: Función de configuración de cuotas.
#Parametros de entrada: Directorio donde creamos la QUOTA


function f_configquota {
dir = $1
echo "Ahora procedemos a editar las cuotas"
sleep 1s
echo "Por favor procede a ingresar el usuario al que quieres copiar la cuota"
read USER
sleep 1s
echo 'Ahora procede a ingresar el límite blando de la cuota (Ej: 200M 5G)'
read blando
echo 'Ahora procede a ingresar el límite duro de la cuota (Ej: 250M 6G)'
read duro
echo 'Quieres añadir inodos para limitar la cantidad de archivos? (s/n)'
read conf
if [[ $conf = s ]] || [[ $conf = S ]]; then
	echo 'Dime el límite blando de inodos (Ej: 1000)'
	read inodob
	echo 'Dime el límite duro de inodos (Ej:1500)'
	read inodod
	quotatool -u $USER -bq $blando -l $duro -iq $inodob -l $inodod $dir
else
	echo 'Has decidido no insertar inodos'
	quotatool -u $USER -bq $blando -l $duro $dir
fi
listado=$(cat /etc/passwd | awk -F ':' '{print $1}') 
edquota -p $USER $listado
}

#!/usr/bin/env bash
#Autor: nazareth
#Versión: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Descripción: funcion de comprobacion si existe el directorio /QUOTA
#Fecha de creación: mar 29 mar 2022 10:30:58 CET

#zona declaracion de funciones

#funcion que comprueba si existe el directorio
#salida: mensajes de confirmacion
#entrada: directorio donde instalemos la QUOTA


function f_existedirectorio {
	
        if [ -d "$1" ]; then
        echo "El directorio ya existe"
        else
        echo "No existe el directorio $1" 
        echo "Creando directorio ..." && sleep 2s && echo $(mkdir $1) && echo "Directorio creado"
        fi
}


#fin zona
#!/usr/bin/env bash
# Función que habilita la cuota y crea los ficheros aquota.user y aquota.group
# no tiene ni parámetros de entrada ni de salida

function f_habilita_quota {
    if [[ ! -e $1/aquota.user && ! -e $1/aquota.group ]]
    then
        quotacheck -ugv $1 &> /dev/null
        mount -a
        chmod o+rwx $1
        quotaon -a
        echo 'se ha habilitado la cuota'
    else
        echo 'los ficheros ya existen'
        
    fi
}

#!/usr/bin/env bash
# Función que instala el sistema de archivos ext4 en el disco indicado
# parámetros de entrada: disco, no tiene parámetros de salida

function f_instalaext4 {
    mkfs.ext4 /dev/$1
}

# instala quota y quotatools para un sistema debian

function f_instalaquota() {
    apt install quota quotatool
}

#!/usr/bin/env bash


#Descripción: Modifica el fichero fstab

#Zona de declaración de variables

#Fin zona

#Zona de declaración de funciones

function f_modifstab { 

echo "UUID=$1 $2 ext4 defaults,usrquota,grpquota 0 0" >> /etc/fstab
mount -a

}

#Argumentos ded la función: $1 = UUID  $2 = /QUOTA
#Valor devuelto por la función: Introducir información del disco en /etc/fstab
#!/bin/bash
function f_plantilla_cuota {
#Preguntar  el nombre del usuario y si queremos crearlo.
read -p  "Nombre del usuario que deseas crear: " USER
read -p -s  "Contraseña del usuario:  "  CON
read -p "¿Deseas continuar con la operacón? S/N: " RESPUESTA
if [[ $RESPUESTA  == S ]] || [[ $RESPUESTA == s ]] || [[ $RESPUESTA  == Y ]] || [[ $RESPUESTA == y ]] ; then
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

#!/usr/bin/env bash
#Autor: nazareth
#Versión: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Descripción: funcion para conseguir el UUID
#Fecha de creación: mié 30 mar 2022 08:52:40 CET

#zona declaracion de funciones

#funcion que consigue el UUID
#salida: UUID
#entrada: Disco que queremos buscar

function f_UUID {
        echo $(blkid | egrep /$1: | egrep -o "[a-z0-9]{8}-([a-z0-9]{4}-){3}[a-z0-9]{12}")
}

#fin zona
