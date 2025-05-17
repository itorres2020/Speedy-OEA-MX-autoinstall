#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

OSD="OSCam_11718-r798"
PID=$(pidof ${OSD})
Action=$1

cam_clean() {
	rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/oscam* /tmp/.oscam
}

cam_handle() {
	if test -z "${PID}"; then
		cam_up
	else
		cam_down
	fi
}

cam_down() {
	killall -9 ${OSD}
	sleep 2
	cam_clean
}

cam_up() {
	cam_clean
	/usr/bin/${OSD} &
}

if test "$Action" = "cam_startup"; then
	if test -z "${PID}"; then
		cam_down
		cam_up
	else
		echo "${OSD} already running, exiting..."
	fi
elif test "$Action" = "cam_res"; then
	cam_down
	cam_up
elif test "$Action" = "cam_down"; then
	cam_down
elif test "$Action" = "cam_up"; then
	cam_up
else
	cam_handle
fi

exit 0
