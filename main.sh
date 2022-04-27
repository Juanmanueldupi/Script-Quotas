#!/usr/bin/env bash
source src/libreria.sh

#Variables
clear -x
f_compruebaroot
lsblk -f
echo "dime el disco (ej: sda, vda, vdb...)"
read disco
f_instalaext4 $disco
uuid=$(f_UUID $disco)
f_instalaquota
dir="/QUOTA"

#llamada a las funciones

f_existedirectorio $dir
f_modifstab $uuid $dir
f_habilita_quota
f_plantilla_cuota
f_configquota $dir



