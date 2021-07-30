#!/vendor/bin/sh
# Uperf Runner
# https://github.com/yc9559/
# Author: Matt Yang
# Version: 20200401

BASEDIR=${0%/*}
SCRIPT_DIR="$BASEDIR/script"

chmod 755 /data/powercfg.sh
chmod 755 /data/powercfg-base.sh

# powercfg path provided by magisk module
echo "sh $SCRIPT_DIR/powercfg_main.sh \"\$1\"" >> /data/powercfg.sh

# create busybox symlinks
BB=$BASEDIR/bin/busybox
$BB/busybox --install -s $BB

$BB/sh $SCRIPT_DIR/prepare.sh
$BB/sh $SCRIPT_DIR/powercfg_once.sh
$BB/sh $SCRIPT_DIR/start_injector.sh
