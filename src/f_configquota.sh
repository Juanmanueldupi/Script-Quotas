#!/usr/bin/env bash
#Autor: Antonio Marchán
#Version: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Fecha de creación: mar 29 mar 2022 10:26:54 CEST
#Fecha de modificación:
#Desripción: Función de configuración de cuotas.

function f_configquota {
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
