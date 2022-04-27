#!/usr/bin/env bash
source src/libreria.sh

#Variables
clear -x
echo "*.· Accediendo a la configuración de QUOTAS ·.*"
echo " "
f_compruebaroot
lsblk -f
echo " "
echo "Dime el disco (ej: sda, vda, vdb...):"
read disco
f_instalaext4 $disco
uuid=$(f_UUID $disco)
f_instalaquota
dir="/QUOTA"

#llamada a las funciones

f_existedirectorio $dir
f_modifstab $uuid $dir $disco
f_habilita_quota $dir $disco
f_plantilla_cuota
f_configquota $dir
echo " "
echo "*.· La QUOTA ha sido configurada con éxito ·.*"


