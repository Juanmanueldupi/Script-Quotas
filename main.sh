#!/usr/bin/env bash
source src/f_compruebaroot.sh
source src/f_instalaext4.sh
source src/f_UUID.sh
source src/f_configquota.sh
source src/f_existedirectorio.sh
source src/f_habilita_quota.sh
source src/f_plantilla_cuota.sh
source src/f_modificafstab.sh

#Variables
echo "dime el disco (ej: sda, vda, vdb...)"
read disco
f_instalaext4 $disco
uuid=$(f_UUID $disco)
dir="/QUOTA"

#llamada a las funciones

f_compruebaroot
f_existedirectorio
f_modifstab $uuid $dir
f_habilita_quota
f_plantilla_cuota
f_configquota



