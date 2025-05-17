#!/bin/bash
#### "***********************************************"
#### "*       ..:: Script by MOHAMED_OS ::..        *"
#### "*  Support: https://github.com/MOHAMED19OS    *"
#### "*       E-Mail: mohamed19eng@gmail.com        *"
#### "***********************************************"
FIN="=================================================="

#### Binary File ####
BIN_FILES="oscam"
BIN="OSCam_11718-r798"

##### Path File #####
TMPDIR="/tmp/DzOSat"
CONFIGPATH='/etc/tuxbox/config'

##### Bianry Path #####
BIN_AARCH64="${TMPDIR}/AARCH64/${BIN}"
BIN_ARM="${TMPDIR}/ARM/${BIN}"
BIN_MIPS="${TMPDIR}/MIPS/${BIN}"
BIN_SH4="${TMPDIR}/SH4/${BIN}"

#### checking your device and bin file #####
echo ${FIN}
echo ":I'm checking your device processor ..."

if uname -m | grep -qs armv7l; then
    echo ":Your Device IS ARM processor ..."
    if [ ! -f ${BIN_ARM} ]; then
        echo "Bin file Missing :("
    else
        mv -f ${BIN_ARM} ${TMPDIR} >/dev/null 2>&1
    fi
elif uname -m | grep -qs aarch64; then
    echo ":Your Device IS AARCH64 processor ..."
    if [ ! -f ${BIN_AARCH64} ]; then
        echo "Bin file Missing :("
    else
        mv -f ${BIN_AARCH64} ${TMPDIR} >/dev/null 2>&1
    fi
elif uname -m | grep -qs mips; then
    echo ":Your Device IS MIPS processor ..."
    if [ ! -f ${BIN_MIPS} ]; then
        echo "Bin file Missing :("
    else
        mv -f ${BIN_MIPS} ${TMPDIR} >/dev/null 2>&1
    fi
elif uname -m | grep -qs 7401c0; then # dm800 clone
    echo ":Your Device IS dm800 clone processor ..."
    if [ ! -f ${BIN_MIPS} ]; then
        echo "Bin file Missing :("
    else
        mv -f ${BIN_MIPS} ${TMPDIR} >/dev/null 2>&1
    fi
elif uname -m | grep -qs sh4; then
    echo ":Your Device IS SH4 processor ..."
    if [ ! -f ${BIN_SH4} ]; then
        echo "Bin file Missing :("
    else
        mv -f ${BIN_SH4} ${TMPDIR} >/dev/null 2>&1
    fi
else
    echo "Sorry, your device does not have the proper Emu :("
    rm -rf ${TMPDIR} >/dev/null 2>&1
    exit 1
fi

####
if [ -r /usr/lib/enigma2/python/Plugins/Extensions/DreamOSatcamManager ]; then
    echo "DreamOSat camManager"
    cp -rf ${TMPDIR}/DreamOSat/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1

#### OE2.5 ####
elif [ -e /etc/apt/sources.list.d/gp4-unstable-all-feed.list ]; then
    echo "GP4 image"
    cp -rf ${TMPDIR}/GP4/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -e /usr/lib/enigma2/python/Plugins/Bp/geminimain ]; then
    echo "GP3 image"
    cp -rf ${TMPDIR}/dddemon/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "OoZooN" /etc/image-version; then
    echo "OoZooN image"
    cp -rf ${TMPDIR}/oozoon/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/camd ]; then
        mkdir -p /usr/bin/camd >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/camd/ >/dev/null 2>&1
elif grep -qs -i "newnigma2" /etc/image-version; then
    echo "newnigma2 image"
    cp -rf ${TMPDIR}/newnigma2/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "deb http://debfeed4.merlin.xyz" cat /etc/apt/sources.list; then
    echo "Merlin4 OE2.5 image"
    cp -rf ${TMPDIR}/Merlin4/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/AddOnManager ]; then
    echo "Merlin3 image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif grep -qs -i "deb http://feed.dream-elite.net" cat /etc/apt/sources.list.d/all-feed.list; then
    echo "Dream-Elite OE2.5 image"
    if [ ! -d /var/bin ]; then
        ln -sfn /usr/bin /var/bin
    fi
    cp -rf ${TMPDIR}/dreamelite2/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
    touch /etc/DExtra
elif [ -r /usr/lib/enigma2/python/DE ]; then
    echo "Dream-Elite image"
    if [ ! -d /var/bin ]; then
        ln -sfn /usr/bin /var/bin
    fi
    cp -rf ${TMPDIR}/dreamelite/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "Power-Sat" /etc/issue.net; then
    echo "PowerSat image"
    cp -rf ${TMPDIR}/PowerSat/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "SatLodge" /etc/issue.net; then
    echo "SatLodge image"
    cp -rf ${TMPDIR}/SatLodge/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "Peter" /etc/issue.net; then
    echo "PeterPan image"
    cp -rf ${TMPDIR}/PeterPan/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
    if [ -f /usr/ppteam/.emulist ]; then
        if ! grep -qs -i "${BIN}" /usr/ppteam/.emulist; then
            sed -i "1i 10\*${BIN}.pp\* ${BIN} \*" /usr/ppteam/.emulist
        fi
    else
        echo "10\*${BIN}.pp\* ${BIN} \*" >/usr/ppteam/.emulist
    fi
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/Blue_Panel ]; then
    echo "Demonisat image"
    cp -rf ${TMPDIR}/demonisat/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
    systemctl daemon-reload

#### OE2.0 ####
elif grep -qs -i "OpenNFR" /etc/image-version; then
    echo "OpenNFR image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Blackhole ]; then
    echo "Blackhole image"
    cp -rf ${TMPDIR}/BH/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -f /usr/lib/enigma2/python/Screens/BpBlue.pyc ]; then
    echo "OpenBlackhole image"
    cp -rf ${TMPDIR}/BH/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/SystemPlugins/VTIPanel ]; then
    echo "VTI image"
    cp -rf ${TMPDIR}/vti/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "ItalySat" /etc/image-version; then
    echo "ItalySat image"
    if [ ! -d /var/bin ]; then
        ln -sfn /usr/bin /var/bin
    fi
    cp -rf ${TMPDIR}/italysat/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "OpenSPA" /etc/image-version; then
    echo "OpenSPA image"
    cp -rf ${TMPDIR}/dddemon/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "openATV" /etc/image-version; then
    echo "openATV image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/OPENDROID ]; then
    echo "OpenDroid image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/EGAMI ]; then
    echo "Egami image"
    if [ ! -d /var/bin ]; then
        ln -sfn /usr/bin /var/bin
    fi
    cp -rf ${TMPDIR}/egami/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Satdreamgr ]; then
    echo "SatdreamGr image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/PowerboardCenter ]; then
    echo "PBnigma-VIX image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif grep -qs -i "PURE2" /etc/image-version; then
    echo "PURE2 image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif grep -qs -i "openpli" /etc/issue; then
    echo "OpenPLI image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "openvision" /etc/issue; then
    echo "OpenVision image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "cobralibero" /etc/issue; then
    echo "CobraLibero image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "rudream" /etc/image-version; then
    echo "ruDREAM image"
    cp -rf ${TMPDIR}/rudream/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/PKT ]; then
    echo "PKT image"
    if [ ! -r /var/emu ]; then
        mkdir -p /var/emu >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /var/emu/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/SystemPlugins/ViX ]; then
    echo "OpenVIX image"
    if [ ! -r /usr/softcams ]; then
        mkdir -p /usr/softcams >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/softcams/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/HDMUCenter ]; then
    echo "HDMU image"
    cp -rf ${TMPDIR}/HDMU/* / >/dev/null 2>&1
    if [ ! -r /usr/emu ]; then
        mkdir -p /usr/emu >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/emu/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/HDF-Toolbox ]; then
    echo "OpenHDF image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/LDteam ]; then
    echo "OpenLD image"
    cp -rf ${TMPDIR}/BH/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/ExtraAddonss ]; then
    echo "OpenESI image"
    cp -rf ${TMPDIR}/OpenESI/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "teamBlue" /etc/image-version; then
    echo "TeamBlue image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Extensions/NssPanel ]; then
    echo "NonSoloSat image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif grep -qs -i "OpenEight" /etc/image-version; then
    echo "OpenEight image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "openMips" /etc/image-version; then
    echo "OpenMips image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif grep -qs -i "OpenPlus" /etc/image-version; then
    echo "OpenPlus image"
    cp -rf ${TMPDIR}/OpenPlus/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "titannit" /etc/image-version; then
    echo " OpenAFF-Titan image"
    cp -rf ${TMPDIR}/OpenPlus/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/TSimage ]; then
    echo "OpenTS/Ts image"
    cp -rf ${TMPDIR}/Merlin3/* / >/dev/null 2>&1
    if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam >/dev/null 2>&1
    fi
    cp -rf ${TMPDIR}/${BIN} /usr/bin/cam/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/SystemPlugins/DemonisatManager ]; then
    echo "DDD-Demoni image"
    cp -rf ${TMPDIR}/dddemon/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/Plugins/Domica ]; then
    echo "Domica image"
    cp -rf ${TMPDIR}/domica/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif [ -r /usr/lib/enigma2/python/LT ]; then
    echo "LT image"
    cp -rf ${TMPDIR}/LT/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "openfix" /etc/issue; then
    echo "OpenFIX image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
elif grep -qs -i "opentr" /etc/issue; then
    echo "OpenTR image"
    cp -rf ${TMPDIR}/openpli/* / >/dev/null 2>&1
    cp -rf ${TMPDIR}/${BIN} /usr/bin/ >/dev/null 2>&1
else
    rm -r ${TMPDIR} >/dev/null 2>&1
    echo "No emu script to this image now .. ask about it :("
    rm -rf /tmp/enigma2-plugin-softcams-oscam*.ipk
    exit 1
fi

#### Checking Config Files ####
if [ ! -d ${CONFIGPATH} ]; then
    mkdir -p ${CONFIGPATH} >/dev/null 2>&1
fi

echo ${FIN}
echo ":I'm checking your config OSCam ..."
for file in ${BIN_FILES}.conf ${BIN_FILES}.dvbapi ${BIN_FILES}.provid ${BIN_FILES}.server ${BIN_FILES}.services ${BIN_FILES}.user CCcam.cfg; do
    if [ ! -f "${CONFIGPATH}/${file}" ]; then
        cp -f "${TMPDIR}${CONFIGPATH}/${file}" $CONFIGPATH >/dev/null 2>&1
        echo "  send: ${file} ... file"
    fi
done
echo ${FIN}

#### Checking OpenPLI Softcam Symlink ####
if [ -f /etc/init.d/softcam.None ]; then
    if type update-rc.d 2>/dev/null; then
        if [ -n "${D}" ]; then
            OPT="-r ${D}"
        else
            OPT="-s"
        fi
        update-rc.d ${OPT} softcam defaults 50 >/dev/null 2>&1
    fi
fi
