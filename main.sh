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

# Archivo de credenciales
ARCHIVO_CREDENCIALES="credenciales.txt"

# Función para escribir lento
escribir_lento() {
    local texto="$1"
    for ((i=0; i<${#texto}; i++)); do
        printf "%s" "${texto:$i:1}"
        sleep 0.05
    done
    echo ""
}

# ASCII de Bienvenida
ascii_art=(
"░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ "  
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░" 
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░" 
"░▒▓███████▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░" 
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░" 
"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░" 
"░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ "                                                                                                                  
)

# ---------------------------------------------------
# FUNCIONES DE CONTROL
# ---------------------------------------------------

# Desactivar Ctrl+C y Ctrl+Z
trap '' SIGINT SIGTSTP

# ---------------------------------------------------
# INICIO DEL PROGRAMA
# ---------------------------------------------------

# Mostrar ASCII
for linea in "${ascii_art[@]}"; do
    printf "${cyan}%s${reset}\n" "$linea"
    sleep 0.1
done

# Pedir login
escribir_lento "${magenta}Bienvenido a esta terminal :)${reset}"
echo ""
read -p "Usuario: " user
read -s -p "Contraseña: " pass
echo

# Verificar usuario del sistema
#if ! id "$user" &>/dev/null || ! echo "$pass" | su -c "exit" "$user" &>/dev/null; then
#    escribir_lento "${rojo}Acceso denegado.${reset}"
#    exit 1
#fi

# Verificar usuario apartir del archivo de credenciales
if ! grep -q "^$user:$pass$" "$ARCHIVO_CREDENCIALES"; then
    escribir_lento "${rojo}Acceso denegado.${reset}"
    exit 1
fi

# ---------------------------------------------------
# TERMINAL 
# ---------------------------------------------------

# Iniciar Terminal
while true; do
    # Mostrar prompt
    echo -en "${negrita}${azul}${user}@$(pwd) $ ${reset}"

    # Leer comando
    read cmd

    # Si escribe salir
    if [ "$cmd" = "salir" ]; then
        escribir_lento "${rosita}Hasta pronto, $user.${reset}"
        exit 0
    fi

    # Si es uno de los comandos
    if [ -f "./${cmd}.sh" ]; then
        bash "./${cmd}.sh"
    else
        # Ejecutar comandos normales
        eval "$cmd"
    fi
done
