#!/bin/bash

# Verificar que mpg123 esté instalado
if ! command -v mpg123 &> /dev/null; then
    echo "mpg123 no está instalado. ¿Deseas instalarlo? (s/n)"
    read respuesta
    if [[ "$respuesta" == "s" ]]; then
        sudo apt update && sudo apt install mpg123
    else
        echo "No se puede ejecutar el reproductor sin mpg123."
        exit 1
    fi
fi

# Ruta donde se almacena la música
ruta_musica="$HOME/Música"

# Comprobar si hay canciones
canciones=()
while IFS= read -r -d $'\0' cancion; do
    canciones+=("$cancion")
done < <(find "$ruta_musica" -type f -name "*.mp3" -print0 2>/dev/null)

if [ ${#canciones[@]} -eq 0 ]; then
    echo "No se encontraron canciones mp3 en $ruta_musica"
    exit 1
fi

indice=0

# Función para mostrar el menú
# y la canción actual
mostrar_menu() {
    echo "🎵 Reproductor de Música"
    nombre_cancion=$(basename "${canciones[$indice]}")
    echo "Canción actual: $nombre_cancion"
    echo "[n] Siguiente"
    echo "[p] Anterior"
    echo "[q] Salir"
}


while true; do
    clear
    mostrar_menu
    mpg123 -q "${canciones[$indice]}" &
    pid=$!
    read -n 1 -s opcion
    kill $pid &>/dev/null

    case "$opcion" in
        n)
            ((indice++))
            if ((indice >= ${#canciones[@]})); then
                indice=0
            fi
            ;;
        p)
            ((indice--))
            if ((indice < 0)); then
                indice=$((${#canciones[@]} - 1))
            fi
            ;;
        q)
            echo "Saliendo..."
            exit 1
            ;;
    esac
done
