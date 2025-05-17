#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="OSCam_11718-r798"

usage() {
	echo "Usage: $0 {start|stop|restart|reload}"
}

remove_tmp() {
	rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam
}

if [ $# -lt 1 ]; then
	usage
fi
action=$1

case "$action" in
start)
	echo "[SCRIPT] $1: $CAMNAME"
	remove_tmp
	/usr/bin/${CAMNAME} &
	;;
stop)
	echo "[SCRIPT] $1: $CAMNAME"
	killall -9 ${CAMNAME}
	remove_tmp
	;;
restart | reload)
	$0 stop
	$0 start
	;;
*)
	usage
	;;
esac

exit 0
