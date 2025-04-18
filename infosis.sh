#!/bin/bash

# Limpia pantalla al iniciar
tput clear 

# Formatos con tput
negrita=$(tput bold)
reset=$(tput sgr0)

# Colores con tput
rojo=$(tput setaf 160)
morado=$(tput setaf 165)
rosita=$(tput setaf 219)
azul=$(tput setaf 63)
magenta=$(tput setaf 207)
cyan=$(tput setaf 14)
gris=$(tput setaf 247)

# Animación 
escribir_lento() {
    local texto="$1"
    for ((i=0; i<${#texto}; i++)); do
        printf "%s" "${texto:$i:1}"
        sleep 0.05
    done
    echo ""
}

# ASCII INFOSIS estilo terminal
ascii_art=(

"░▒▓█▓▒░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓█▓▒░░▒▓███████▓▒░" 
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░       "        
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░       "
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓██████▓▒░ "
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░"
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░"
"░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░ "                                                                         

)


# Mostrar ASCII con animación
for linea in "${ascii_art[@]}"; do
    printf "${cyan}%s${reset}\n" "$linea"
    sleep 0.1
done

echo ""
escribir_lento "${magenta}:: INICIANDO SISTEMA ::${reset}"
sleep 0.5

# Funciones del sistema
memory() {
    ram=$(ram)
    printf "${gris}${negrita}Memoria:${reset} %s\n" "$ram"
}

ram() {
    case "$(uname)" in
        *BSD*|MINIX)
            sysctl -n hw.physmem
            ;;
        Darwin)
            sysctl -n hw.memsize
            ;;
        *)
            awk '
                /MemTotal/ { total=$2 }
                /MemFree/  { free=$2 }
                /Buffers/  { buf=$2 }
                /^Cached/  { cache=$2 }
                END {
                    used = total - free - buf - cache
                    printf "%.2f MiB / %.2f MiB", used/1024, total/1024
                }' /proc/meminfo
            ;;
    esac
}

cpu() {
    printf "${gris}${negrita}CPU Architecture:${reset} %s\n" "$(uname -m)"
}

os() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        printf "${gris}${negrita}Sistema Operativo:${reset} %s\n" "$PRETTY_NAME"
    else
        printf "${gris}${negrita}Sistema Operativo:${reset} Desconocido\n"
    fi
}

# Ejecutar funciones
memory
cpu
os
