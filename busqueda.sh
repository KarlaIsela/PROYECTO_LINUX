#!/bin/bash

buscar_archivo() { 

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

echo "Ingresa la ruta de la carpeta donde quieres buscar:"
read carpeta

echo "Ingresa el nombre del archivo que quieres buscar:"
read archivo

buscar_archivo 
