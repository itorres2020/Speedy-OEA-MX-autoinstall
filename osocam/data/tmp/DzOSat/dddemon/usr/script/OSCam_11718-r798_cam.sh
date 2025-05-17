#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMD_ID=6091
CAMD_NAME="OSCam_11718-r798"

INFOFILE_A=ecm0.info
INFOFILE_B=ecm1.info
INFOFILE_C=ecm2.info
INFOFILE_D=ecm3.info
#Expert window
INFOFILE_LINES=1111111111000000
#Zapp after start
REZAPP=0

########################################

logger "$0" "$1"
echo "$0" "$1"

remove_tmp() {
  rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam
}

case "$1" in
start)
  remove_tmp
  /usr/bin/${CAMD_NAME} &
  ;;
stop)
  killall -9 ${CAMD_NAME} 2>/dev/null
  sleep 2
  remove_tmp
  ;;
*)
  $0 stop
  exit 0
  ;;
esac

exit 0
