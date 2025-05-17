#!/bin/sh
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"

CAMNAME="OSCam_11718-r798"

/usr/script/${CAMNAME}_cs.sh stop
sleep 5

rm -rf /usr/bin/"${CAMNAME:?}" >/dev/null 2>&1
rm -rf /usr/script/${CAMNAME}_cs.sh >/dev/null 2>&1
rm -rf /usr/uninstall/${CAMNAME}_remove.sh >/dev/null 2>&1
rm -rf /lib/systemd/system/emu-${CAMNAME}.service >/dev/null 2>&1
dpkg --remove enigma2-plugin-softcams-oscam
exit 0
