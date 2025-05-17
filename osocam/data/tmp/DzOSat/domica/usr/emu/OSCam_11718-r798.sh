#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="OSCam_11718-r798"

remove_tmp() {
  rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam
}

case "$1" in
start)
  remove_tmp
  /usr/bin/${CAMNAME} &
  ;;
stop)
  killall -9 ${CAMNAME} 2>/dev/null
  sleep 2
  remove_tmp
  ;;
*)
  $0 stop
  exit 0
  ;;
esac

exit 0
