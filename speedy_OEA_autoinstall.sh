#!/bin/bash
# Provides: jungle-team and tochtly
# Description: Speedy OEA autoinstall, instalacioon complemenetos.
# Version: 1.5.1
# Date: 29/04/2025

# Definimos variables de colores
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

#Definimos variables de comprobacion version python en receptor
PYTHON_VERSION=$(python --version 2>&1 | awk '{print $2}')
PYTHON_MAJOR_VERSION=$(echo "$PYTHON_VERSION" | cut -d'.' -f1)

#Definimos tiempo espera
TIEMPO_ESPERA="sleep 5"

#Definimos bandera idioma script
BANDERA_IDIOMA="mx"

#Definimos texto salida speedy
TEXTO_SALIDA="se procede a cerrar la ejecucion de speedy OEA autoinstall"

# Borramos terminal y se ejecuta cabezera
clear
echo -e "${GREEN}******************************************************************************${RESET}"
echo -e "${GREEN}*                         Speedy OEA Autoinstall                              *${RESET}"
echo -e "${GREEN}*      grupo telegram: https://t.me/joinchat/AFo2KEfzM5Tk7y3VqIOA             *${RESET}"
echo -e "${GREEN}*                            VERSION 1.5.1                                    *${RESET}"
echo -e "${GREEN}*                     jungle-team.com and tochtly                             *${RESET}"
echo -e "${GREEN}******************************************************************************${RESET}"
echo

echo "$BANDERA_IDIOMA es el idioma usado en los mensajes salida del script"

#!/bin/bash

# Definimos comprobacion version python
if [ "$PYTHON_MAJOR_VERSION" = "2" ]; then
    echo -e "${RED}⛔️ Lo siento, Speedy OEA Autoinstall no es compatible con Python 2, $TEXTO_SALIDA.${RESET}"
    $TIEMPO_ESPERA
    exit 1
fi

# Definimos nombre de imagen instalada en receptor enigma2
if [ -f /etc/image-version  ]; then
	DISTRO=$(cat /etc/image-version | grep distro | sed -e 's/distro=//')
elif grep -qs "openpli" /etc/issue ; then
    DISTRO="openpli"
else
    echo -e "${RED}⚠️ No se ha podido detectar la imagen instalada, $TEXTO_SALIDA ${RESET}"
    $TIEMPO_ESPERA
    exit 1
fi

# Se chequea imagen instalada
echo "🔎 Buscando si la imagen instalada es compatible con la instalacion..."
if [[ "$DISTRO" == "openatv" ]]; then
    echo -e "${YELLOW}👍 Se ha detectado que tienes instalado OpenATV, se procede a la ejecucion de la instalacion.${RESET}"
    $TIEMPO_ESPERA
    wget -q '--no-check-certificate' https://raw.githubusercontent.com/itorres2020/Speedy-OEA-MX-autoinstall/refs/heads/main/images-execute/execute_speedy_openatv.sh; bash execute_speedy_openatv.sh; rm -r execute_speedy_openatv.sh
elif [[ "$DISTRO" == "egami" ]]; then
    echo -e "${YELLOW}👍 Se ha detectado que tienes instalado Egami, se procede a la ejecucion de la instalacion.${RESET}"
    $TIEMPO_ESPERA
    wget -q '--no-check-certificate' https://raw.githubusercontent.com/itorres2020/Speedy-OEA-MX-autoinstall/refs/heads/main/images-execute/execute_speedy_egami.sh; bash execute_speedy_egami.sh; rm -r execute_speedy_egami.sh
elif [[ "$DISTRO" == "openspa" ]]; then
    echo -e "${YELLOW}👍 Se ha detectado que tienes instalado openspa, se procede a la ejecucion de la instalacion.${RESET}"
    $TIEMPO_ESPERA
    wget -q '--no-check-certificate' https://raw.githubusercontent.com/itorres2020/Speedy-OEA-MX-autoinstall/refs/heads/main/images-execute/execute_speedy_openspa.sh; bash execute_speedy_openspa.sh; rm -r execute_speedy_openspa.sh
elif [[ "$DISTRO" == "openpli" ]]; then
    echo -e "${YELLOW}👍 Se ha detectado que tienes instalado OpenPLi, se procede a la ejecucion de la instalacion.${RESET}"
    $TIEMPO_ESPERA
    wget -q '--no-check-certificate' https://raw.githubusercontent.com/itorres2020/Speedy-OEA-MX-autoinstall/refs/heads/main/images-execute/execute_speedy_openpli.sh; bash execute_speedy_openpli.sh; rm -r execute_speedy_openpli.sh	          
else
    echo -e "${RED}⛔️ Lo siento, no se ha detectado ninguna imagen compatible, $TEXTO_SALIDA.${RESET}"
    $TIEMPO_ESPERA
    exit 1
fi
