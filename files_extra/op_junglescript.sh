#!/bin/bash
# Menú de opciones para junglescript
# Adaptado para México
# Versión 3.0
#==============================================================================

# Ruta al archivo de configuración
CONFIG_FILE="/usr/bin/enigma2_pre_start.conf"

# Definimos colores para mensajes
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"
RED_BOLD="\e[1;31m"
GREEN_BOLD="\e[1;32m"
YELLOW_BOLD="\e[1;33m"
BLUE_BOLD="\e[1;34m"

# Opciones de configuración de junglescript
options=(
    "Activar lista Canales (marcar si deseas instalación lista canales)"
    "Instalar lista Canales Sky México"
    "Instalar lista Canales Izzi"
    "Instalar lista Canales Dish"
    "Activar Picon (marcar si deseas instalación picon)"
    "Instalar Picon Sky México"
    "Instalar Picon Izzi"
    "Instalar Picon Dish"
)

# Acciones
function JUNGLESCRIPT {
    lista=0
    listacanales=""
    picon=0
    tipopicon=""

    # Asignar valores a las variables según las opciones seleccionadas
    for i in ${!choices[@]}; do
        if [[ ${choices[i]} ]]; then
            case $i in
                0) lista=1 ;;
                1) listacanales="sky-mexico" ;;
                2) listacanales="izzi" ;;
                3) listacanales="dish" ;;
                4) picon=1 ;;
                5) tipopicon="sky-mexico" ;;
                6) tipopicon="izzi" ;;
                7) tipopicon="dish" ;;
            esac 
        fi
    done

    # Actualizar variables en el archivo de configuración
    sed -i "s/^LISTA=.*/LISTA=$lista/" $CONFIG_FILE
    sed -i "s/^LISTACANALES=.*/LISTACANALES=$listacanales/" $CONFIG_FILE
    sed -i "s/^PICONS=.*/PICONS=$picon/" $CONFIG_FILE
    sed -i "s/^TIPOPICON=.*/TIPOPICON=$tipopicon/" $CONFIG_FILE
}

# Variables
ERROR=" "

# Borrar opciones menú
clear

# Función de menú
function MENU {
    echo -e "${BLUE_BOLD}OPCIONES DE CONFIGURACIÓN DE JUNGLESCRIPT${RESET}"
    echo
    echo -e "${YELLOW}-------------------------------------------------------------------------------------------------------------------------------------------"
    echo
    echo  "-Introduce el número de la opción y presiona Enter para confirmar."
    echo  "-Si seleccionaste una opción por error, vuelve a introducir el mismo número para deseleccionarla."
    echo  "-Al terminar, presiona Enter para finalizar."
    echo  "-Si deseas cambiar las opciones una vez terminado SPEEDY, modifica el archivo /usr/bin/enigma2_pre_start.conf"
    echo
    echo -e "-------------------------------------------------------------------------------------------------------------------------------------------${RESET}"
    echo 
    echo
    echo -e "${GREEN_BOLD}Selecciona las opciones que desees instalar y presiona ENTER${RESET}"
    echo

    # Mostrar las opciones del menú con su estado actual
    for i in ${!options[@]}; do
        # Verificar si la opción está seleccionada
        if [[ ${choices[i]} ]]; then
            echo -e "${YELLOW}[$i] [👍] ${options[i]}${RESET}"
        else
            echo -e "${YELLOW}[$i] [ ] ${options[i]}${RESET}"
        fi
    done
}

# Menú de opciones
while true; do
    clear
    MENU
    echo
    read -p $'\033[1;32m'"Selecciona una opción: "$'\033[0m' opcion

    # Comprobar si la opción es válida
    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#options[@]} ]; then
        # Alternar la selección de la opción
        if [[ ${choices[opcion]} ]]; then
            choices[opcion]=""
        else
            choices[opcion]="1"
        fi
    # Si la opción no es válida, mostrar mensaje de error
    elif [[ $opcion == '' ]]; then
        break
    else
        echo -e "${RED_BOLD}ERROR: Opción inválida${RESET}"
        sleep 2
    fi
done

# Ejecutar la función JUNGLESCRIPT para aplicar las opciones seleccionadas
JUNGLESCRIPT
