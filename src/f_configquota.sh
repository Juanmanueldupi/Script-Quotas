#!/usr/bin/env bash
#Autor: Antonio Marchán
#Version: GNU bash, versión 5.1.4(1)-release (x86_64-pc-linux-gnu)
#Fecha de creación: mar 29 mar 2022 10:26:54 CEST
#Fecha de modificación:
#Desripción: Función de configuración de cuotas.

function f_funcionquota {
echo "Ahora procedemos a editar las cuotas"
sleep 1s
echo "Por favor procede a ingresar el usuario al que quieres aplicar la cuota"
read usuario
sleep 1s
echo 'Ahora procede a ingresar el límite blando de la cuota (Ej: 200M 5G)'
read blando
echo 'Ahora procede a ingresar el límite duro de la cuota (Ej: 250M 6G)'
read duro
quotatool -u $usuario -bq $blando -l $duro $dir
}
