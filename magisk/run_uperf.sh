#!/system/bin/sh
# Uperf Runner
# https://github.com/yc9559/
# Author: Matt Yang
# Version: 20200401

BASEDIR="/data/adb/modules/uperf"
SCRIPT_DIR="$BASEDIR/script"

BB="$BASEDIR/bin/busybox"
if [ ! -f "$BB/sh" ]; then
 "$BB"/busybox --install -s "$BB"
fi
"$BB"/sh "$SCRIPT_DIR"/prepare.sh
"$BB"/sh "$SCRIPT_DIR"/powercfg_once.sh
"$BB"/sh "$SCRIPT_DIR"/start_injector.sh
