# Script-Quotas

![QuotaImg](/screenshots/QUOTAIMG.png)


Repositorio conjunto sobre la creación de un script cuya función será la creación y configuración automática de cuotas.
Se implementarán diferentes funciones que posteriormente se invocarán en un script

### **Colaboradores**


* Antonio Marchán Posada

* Juan Manuel Durán Piñero

* Roberto Rodríguez Márquez

* Óscar Ponce de León Sanabria

* Belén Nazareth Durán Meléndez

### **Funciones**


Se han creado las siguientes funciones:

* [f_UUID](/src/f_UUID.sh): con esta función obtendremos el UUID del disco introducido.

* [f_compruebaroot](/src/f_compruebaroot.sh): se usará para comprobar que el usuario esté logueado como superusuario (root).

* [f_configquota](/src/f_configquota.sh): establecida para la configuración de las cuotas partiendo desde el directorio donde se creó la quota.

* [f_existedirectorio](/src/f_existedirectorio.sh): se encarga de comprobar si existe el directorio /QUOTA usando como entrada el directorio donde esté instalada la quota y obteniendo como resultado un mensaje de confirmación, además de la creación del mismo en caso de que no exista.

* [f_habilita_quota](/src/f_habilita_quota.sh): esta es la función que se hace cargo de habilitar la quota y crear los ficheros aquota.user y aquota.group.

* [f_instalaext4](/src/f_instalaext4.sh): como su nombre indica se basa en la instalación del sistemas de archivos ext4 en el disco indicado debiendo usar el mismo como parámetro de entrada.

* [f_instalaquota](/src/f_instalaquota.sh): usada para introducir la instalación de quota y quotatools en un sistema Debian.

* [f_modificafstab](/src/f_modificafstab.sh): la usaremos para modificar el fichero /etc/fstab con una doble redirección para la introducción de los datos.

* [f_plantilla_cuota](/src/f_plantilla_cuota.sh): une la comprobación de superusuario para seguir con la creación del nuevo usuario, por último comprueba si el usuario está en el sistema para que en caso negativo continue con dicha función. 
