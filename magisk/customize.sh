#!/system/bin/sh

$BOOTMODE || abort "! Uperf cannot be installed in recovery."
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" -x 'META-INF/*' -d "$MODPATH"
sh "$MODPATH"/setup_uperf.sh
[ "$?" != "0" ] && abort
rm "$MODPATH"/setup_uperf.sh
