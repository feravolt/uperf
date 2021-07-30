#!/system/bin/sh
# Uperf https://github.com/yc9559/uperf/
# Author: Matt Yang

BASEDIR="/data/adb/modules/uperf"
. $BASEDIR/script/libcommon.sh
. $BASEDIR/script/libuperf.sh

# $1: power_mode
apply_power_mode()
{
    uperf_set_powermode "$1"
    echo "Applying $1 done."
}

# $1: power_mode
verify_power_mode()
{
    # fast -> performance
    case "$1" in
        "powersave"|"balance"|"performance") echo "$1" ;;
        "fast") echo "performance" ;;
        *) echo "balance" ;;
    esac
}

# 1. target from exec parameter
action="$1"
if [ "$action" != "" ]; then
    action="$(verify_power_mode "$action")"
    apply_power_mode "$action"
    exit 0
fi

exit 0
