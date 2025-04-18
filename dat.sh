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


"░▒▓███████▓▒░ ░▒▓██████▓▒░▒▓████████▓▒░" 
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    "
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    "
"░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░ ░▒▓█▓▒░    "
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    "
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    "
"░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    "                            

)

# Mostrar ASCII con animación
for linea in "${ascii_art[@]}"; do
    printf "${cyan}%s${reset}\n" "$linea"
    sleep 0.1
done

echo ""
escribir_lento "${magenta}:: HORA Y FECHA ::${reset}"
sleep 0.5


# Obtener y mostrar la fecha y hora del RTC
grep -E "rtc_(date|time)" /proc/driver/rtc | awk '{print $3}' | xargs echo
