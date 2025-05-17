#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="OSCam_11718-r798"

remove_tmp() {
	rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam /tmp/${CAMNAME}.kill
}

case "$1" in
start)
	remove_tmp
	sleep 1
	/usr/bin/${CAMNAME} &
	sleep 5
	;;
stop)
	touch /tmp/${CAMNAME}.kill
	sleep 3
	killall -9 ${CAMNAME} 2>/dev/null
	sleep 2
	remove_tmp
	;;
*)
	$0 stop
	exit 1
	;;
esac

exit 0
