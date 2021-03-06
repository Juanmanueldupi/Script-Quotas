#!/usr/bin/env bash
# Autor Roberto Rodriguez Marquez
# Función que habilita la cuota y crea los ficheros aquota.user y aquota.group
# no tiene ni parámetros de entrada ni de salida

function f_habilita_quota {
    if [[ ! -e /QUOTA/aquota.user && ! -e /QUOTA/aquota.group ]]
    then
        quotacheck -ugv /QUOTA &> /dev/null
        mount -a
        chmod o+rwx /QUOTA
        quotaon -a
        echo 'se ha habilitado la cuota'
    else
        echo 'los ficheros ya existen'
    fi
}
