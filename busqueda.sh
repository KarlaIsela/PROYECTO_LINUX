#!/bin/bash

buscar_archivo() {
    carpeta=$1
    archivo=$2

    if [ ! -d "$carpeta" ]; then
        echo "Directorio no encontrado"
        return 1
    fi

    encontrado=$(ls "$carpeta" | grep "^$archivo$")

    if [ "$encontrado" != "" ]; then
        echo "Archivo '$archivo' encontrado en: '$carpeta'"
    else
        echo "Archivo '$archivo' no encontrado en: '$carpeta'"
    fi
}

buscar_archivo "$1" "$2"
