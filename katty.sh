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

VIDA=10 
ARCHIVO_VIDA="DVIDA.txt"
PRIMERA_VEZ=false

if [[ -f "$ARCHIVO_VIDA" ]]; then
    VIDA=$(grep -oP 'VIDA=\K[0-9]+' "$ARCHIVO_VIDA")

    if [[ "$VIDA" -le 0 ]]; then
        tput clear
        sleep 3
        echo "${gris}uhm...${reset}"

        sleep 2
        echo "${gris}Esta bien...humano${reset}"

        sleep 2
        echo "${gris}Te daré otra oportunidad...${reset}"
        
        sleep 2
        echo "${negrita}${rosita}Presiona 'A' para revivir a Katty... o cualquier otra tecla para salir${reset}"
        read -n 1 -p "> " REV
        echo ""

        tput clear
        if [[ "$REV" == "A" || "$REV" == "a" ]]; then
            VIDA=10
            echo "VIDA=$VIDA" > "$ARCHIVO_VIDA"
            echo "${azul}¡Katty ha revivido con 10 de vida! 🐱✨${reset}"
            sleep 2
            tput clear
        else
            echo "${rojo}Adiós humano... miau.${reset}"
            exit 0
        fi
    else 
        if [[ "$VIDA" -ge 100 ]]; then
            tput clear
            sleep 3
            echo "${gris}Katty se ha ido...${reset}"
            sleep 3
            exit 0
        fi
    fi
else
    VIDA=10
    echo "VIDA=$VIDA" > "$ARCHIVO_VIDA"
    PRIMERA_VEZ=true
fi

escribir_lento() {
    local texto="$1"
    for ((i=0; i<${#texto}; i++)); do
        printf "%s" "${texto:$i:1}"
        sleep 0.05
    done
    echo ""
}


menu_inicio() {
    sleep 2
    cat << "EOF"
    |\__/,|   (`\
  _.|> <  |_   ) )
-(((---(((--------
EOF
    sleep 2
    escribir_lento "${rojo}AUCH!${reset}"
    sleep 2
    echo "${gris}¡QUÉ FUERTE CAÍDA!${reset}"
    sleep 2
    echo "${gris}...Katty ha caído en tu sistema${reset}"
    sleep 2
    escribir_lento "${magenta}¿Puedes cuidarle hasta que tenga de nuevo 100 de vida?${reset}"
    echo ""
    escribir_lento "${negrita}${rosita}Presiona 'X' si quieres cuidarla...${reset}"
    read -n 1 -p "> " X
    echo ""

    if [[ "$X" == "X" || "$X" == "x" ]]; then
        tput clear  
        juego
        break
    else 
        echo "${gris}OK, ADIÓS!...${reset}"
        rm -f DVIDA.txt
    fi
}

menu_again() {
    cat << "EOF"
 ,_     _
 |\\_,-~/
 / _  _ |    ,--.
(  @  @ )   / ,-'
 \  _T_/-._( (
 /         `. \
|         _  \ |
 \ \ ,  /      |
  || |-_\__   /
 ((_/`(____,-'
EOF
    escribir_lento "${magenta}Hola!, KATTY 🐾 te ha extrañado :). Es bueno verte de nuevo...${reset}"
    echo ""
    escribir_lento "${negrita}${rosita}Presiona 'X' para continuar ...${reset}"
    read -n 1 -p "> " X
    echo ""

    if [[ "$X" == "X" || "$X" == "x" ]]; then
        tput clear  
        juego
        break  
    fi
}

verificar_vida() {
    if [ "$VIDA" -le 0 ]; then
        sleep 3
        tput clear
        echo ""
        escribir_lento "${rojo}La muerte es miau dolorosa... dice Katty 💀${reset}"
        sleep 2
        exit 1
    fi
}

verificar_VIDA_maxima() {
    if [ "$VIDA" -ge 100 ]; then
        sleep 2
        tput clear
        escribir_lento "${magenta}¡Gracias, Miaumano!, ahora podré regresar a miauniverso <3!!!${reset}"
        exit 0
    fi
}

opciones() {
    while true; do
        tput clear
        echo "${negrita}${rosita}VIDA ACTUAL: $VIDA${reset}"
        echo ""
        escribir_lento "${magenta}¿Qué quieres hacer con Katty?${reset}"
        echo "A) Alimentar a Katty"
        echo "B) Jugar con Katty"
        echo "C) Hablar con Katty"
        echo "x) Salir"
        read -n 1 -p "> " OP
        echo ""

        case $OP in
            A|a)
                tput clear
                escribir_lento "${magenta}¿Qué comerá hoy Katty? ≽(•⩊ •マ≼${reset}"
                echo "1) Galletas 🍪‧₊˚✩彡"
                echo "2) ???"
                read -n 1 -p "> " FOOD
                echo ""

                if [ "$FOOD" == "1" ]; then
                    tput clear 
                    escribir_lento "${gris}~Ñam Ñam. Parece que a Katty le han gustado las galletas!${reset}"
                    echo "${cyan}OBTIENE [ +10 VIDA ]${reset}"
                    VIDA=$((VIDA + 10)) 
                else 
                    tput clear
                    escribir_lento "${gris}~Ugh! Dice Katty... ¡¿Qué le has dado?!${reset}"
                    echo "${rojo}OBTIENE [ -10 VIDA ]${reset}"
                    VIDA=$((VIDA - 10))
                fi

                echo "VIDA=$VIDA" > "$ARCHIVO_VIDA"
                verificar_VIDA_maxima
                sleep 2
                verificar_vida
                break
                ;;
            B|b)
                tput clear
                escribir_lento "${gris}¡Katty está jugando con su láser! 🐾${reset}"
                echo "${cyan}OBTIENE [ +5 VIDA ]${reset}"
                VIDA=$((VIDA + 5)) 
                echo "VIDA=$VIDA" > "$ARCHIVO_VIDA"
                verificar_VIDA_maxima
                sleep 2
                verificar_vida
                break
                ;;

            C|c)
                tput clear

                # Arreglo de frases
                frases=(
                    "Katty dice: 'Miau~ ¿tienes snacks?' 🐱"
                    "Katty ronronea y se echa panza arriba. 😽"
                    "Katty te ignora y se va a dormir en tu mochila. 🎒"
                    "Katty muerde tu cable del cargador... otra vez. ��"
                    "Katty se pone a perseguir fantasmas. 👻"
                    "Katty te mira fijamente durante 30 segundos sin razón. 👁️"
                    "Katty te trae una hoja seca como regalo. 🍂"
                    "Katty borra tu proyecto final por accidente. 💻🔥"
                )

                # Arreglo con los cambios de vida correspondientes
                efectos=(-2 5 0 -5 3 -1 7 -10)

                # Obtener un índice aleatorio
                indice=$((RANDOM % 8))

                # Obtener la frase y el efecto con el mismo índice
                texto=${frases[$indice]}
                vida=${efectos[$indice]}

                # Mostrar la frase en gris
                escribir_lento "${gris}$texto${reset}"

                # Mostrar el efecto de vida
                if (( vida > 0 )); then
                    # Si el cambio es positivo
                    echo "${cyan}OBTIENE [ +${vida} VIDA ]${reset}"
                elif (( vida == 0 )); then
                    # Si el cambio es 0
                    echo "${gris}OBTIENE [ 0 VIDA ]${reset}"
                else
                    # Si el cambio es negativo
                    echo "${rojo}OBTIENE [ ${vida} VIDA ]${reset}"
                fi

                # Aplicar el cambio de vida usando suma y resta
                VIDA=$((VIDA + vida))
                echo "VIDA=$VIDA" > "$ARCHIVO_VIDA"

                verificar_VIDA_maxima
                sleep 2
                verificar_vida
                break
                ;;

            X|x)
                tput clear
                echo "${magenta}¡Adiós! 🐾${reset}"
                exit 1
                ;;
            *)
                echo "${rojo}Opción no válida. Intenta de nuevo.${reset}"
                sleep 2
                ;;
        esac
    done
}

juego() {
    tput clear
    escribir_lento "${magenta}MIAUUUU!!!!${reset}"
    sleep 1
    while true; do
        opciones
    done
}

# Mostrar el menú correcto
if [[ "$PRIMERA_VEZ" == true ]]; then
    menu_inicio
else
    menu_again
fi
