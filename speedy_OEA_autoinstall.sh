#!/bin/bash
# Provides: jungle-team
# Description: Speedy OEA autoinstall, instalacioon complemenetos.
# Version: 1.2
# Date: 29/03/2023

# Definimos variables de colores
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

#Definimos tiempo espera
TIEMPO_ESPERA="sleep 5"

#Definimos bandera idioma script
BANDERA_IDIOMA="🇪🇸"

#Definimos texto salida speedy
TEXTO_SALIDA="se procede a cerrar la ejecucion de speedy OEA autoinstall"

# Borramos terminal y se ejecuta cabezera
clear
echo -e "${GREEN}******************************************************************************${RESET}"
echo -e "${GREEN}*                         Speedy OEA Autoinstall                              *${RESET}"
echo -e "${GREEN}*      grupo telegram: https://t.me/joinchat/AFo2KEfzM5Tk7y3VgcqIOA           *${RESET}"
echo -e "${GREEN}*                            VERSION 1.2                                      *${RESET}"
echo -e "${GREEN}*                           jungle-team.com                                   *${RESET}"
echo -e "${GREEN}******************************************************************************${RESET}"
echo

echo "$BANDERA_IDIOMA es el idioma usado en los mensajes salida del script"

# Definimos nombre de imagen instalada en receptor enigma2
if [ -f /etc/image-version  ]; then
	DISTRO=$(cat /etc/image-version | grep distro | sed -e 's/distro=//')
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
else
    echo -e "${RED}⛔️ Lo siento, no se ha detectado ninguna imagen compatible, $TEXTO_SALIDA.${RESET}"
    $TIEMPO_ESPERA
    exit 1
fi
