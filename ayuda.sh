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


# Función para mostrar el menú de ayuda
mostrar_ayuda() {
    echo ""
    echo "${morado}${negrita}¡Hola! 👋 Estos son los comandos disponibles para esta terminal:${reset}"

    echo ""
    echo "${cyan}${negrita}Comandos disponibles:${reset}"
    echo "${azul}${negrita} ayuda${reset}        Muestra esta ayuda."
    echo "${azul}${negrita} infosis${reset}      Muestra información del sistema (RAM, arquitectura, versión del SO)."
    echo "${azul}${negrita} dat${reset}          Muestra la fecha y hora actual."
    echo "${azul}${negrita} busqueda${reset}     Busca un archivo en una carpeta específica."
    echo "${azul}${negrita} creditos${reset}     Muestra los créditos del programador"
    echo "${azul}${negrita} katty${reset}        Juega con Katty!!."
    echo "${azul}${negrita} reproductor${reset}  Abre tu reproductor MP3."
    echo "${azul}${negrita} salir${reset}        Cierra esta terminal."
    echo ""
} 

# ASCII AYUDA estilo terminal
ascii_art=(
" ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ "
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
"░▒▓████████▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░"
"░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
"░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
"░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░    ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░"                                                    
)

# Mostrar ASCII con animación
for linea in "${ascii_art[@]}"; do
    printf "${cyan}%s${reset}\n" "$linea"
    sleep 0.1
done

mostrar_ayuda