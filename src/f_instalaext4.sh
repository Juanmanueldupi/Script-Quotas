# Función que instala el sistema de archivos ext4 en el disco indicado
# parámetros de entrada: disco, no tiene parámetros de salida

function f_instalaext4 {
    mkfs.ext4 /dev/$1
}