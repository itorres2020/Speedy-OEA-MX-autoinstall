#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="OSCam_11718-r798"

usage() {
	echo "Usage: $0 {start|stop|status|restart|reload}"
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
	echo "Start cam daemon: ${CAMNAME}"
	remove_tmp
	/usr/bin/${CAMNAME}
	echo " ${CAMNAME}."
	;;

stop)
	echo "Stopping cam daemon: ${CAMNAME}"
	while [ -n "$(pidof ${CAMNAME})" ]; do
		killall -9 ${CAMNAME}
	done
	remove_tmp
	echo "."
	;;

status) ;;

\
	restart | reload)
	$0 stop
	sleep 2
	$0 start
	;;
*)
	usage
	;;
esac

exit 0
