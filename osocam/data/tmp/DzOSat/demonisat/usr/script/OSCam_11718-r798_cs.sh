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
	systemctl stop dccamd
	sleep 2
	systemctl disable dccamd
	sleep 2
	systemctl start emu-${CAMNAME}.service
	sleep 2
	systemctl enable emu-${CAMNAME}.service
	sleep 2
	;;
stop)
	remove_tmp
	systemctl stop emu-${CAMNAME}.service
	sleep 2
	systemctl disable emu-${CAMNAME}.service
	sleep 2
	;;
restart | reload)
	$0 stop
	sleep 3
	$0 start
	;;
*)
	$0 stop
	exit 1
	;;
esac
exit 0
