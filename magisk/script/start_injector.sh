#!/system/bin/sh
# Injector Library
# https://github.com/yc9559/
# Author: Matt Yang
# Version: 20210225
# FeraVolt: Don't allow selinux switches

BASEDIR="/data/adb/modules/uperf"
. $BASEDIR/script/pathinfo.sh
. $BASEDIR/script/libcommon.sh

###############################
# PATHs
###############################

INJ_REL="$BIN_DIR"
INJ_NAME="sfa_injector"

###############################
# Injector tool functions
###############################

# $1:process $2:dynamiclib $3:alog_tag
inj_do_inject()
{
    log "[begin] injecting $2 to $1"

    local lib_path
    if [ "$(is_aarch64)" = "true" ]; then
        lib_path="/system/lib64/$2"
    else
        lib_path="/system/lib/$2"
    fi

    # fallback to standlone mode
    [ ! -e "$lib_path" ] && lib_path="${MODULE_PATH}${lib_path}"

    # try to allow executing dlopen in surfaceflinger
    magiskpolicy --live "allow surfaceflinger system_lib_file file { read getattr execute }" >> "$LOG_FILE"
    magiskpolicy --live "allow surfaceflinger system_data_file file { read write getattr }" >> "$LOG_FILE"
    magiskpolicy --live "allow surfaceflinger system_data_file dir { read write getattr search }" >> "$LOG_FILE"

    "$INJ_REL/$INJ_NAME" "$lib_path" >> "$LOG_FILE"

    sleep 1
    log "[end] injecting $2 to $1"
    log ""
}

inj_do_inject "/system/bin/surfaceflinger" "libsfanalysis.so" "SfAnalysis"
