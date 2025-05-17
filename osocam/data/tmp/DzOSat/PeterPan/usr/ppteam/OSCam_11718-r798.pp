#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

NAME="OSCam_11718-r798"

remove_tmp() {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam
}

case "$1" in
start)
    echo "[SCRIPT] $1: ${NAME}"
    remove_tmp
    sleep 1
    /usr/bin/${NAME} &
    sleep 1
    pidof ${NAME} >/tmp/${NAME}.pid
    ;;
stop)
    echo "[SCRIPT] $1: ${NAME}"
    killall -9 ${NAME} 2>/dev/null
    sleep 1
    remove_tmp
    ;;
*)
    $0 stop
    exit 1
    ;;
esac

exit 0
