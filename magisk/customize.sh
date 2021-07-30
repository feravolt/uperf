#!/system/bin/sh

$BOOTMODE || abort "! Uperf cannot be installed in recovery."
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH > /dev/null
# use universal setup.sh
sh $MODPATH/setup_uperf.sh
[ "$?" != "0" ] && abort
# use once
rm $MODPATH/setup_uperf.sh
