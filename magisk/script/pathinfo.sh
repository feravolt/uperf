#!/system/bin/sh

# Module Path Header
# https://github.com/yc9559/
# Author: Matt Yang

MODULE_PATH="/data/adb/modules/uperf"
USER_PATH="/data/media/0/yc/uperf"
PANEL_FILE="$USER_PATH/panel_uperf.txt"
LOG_FILE="$USER_PATH/log_uperf_initsvc.log"
FLAGS="$MODULE_PATH/flags"
SCRIPT_DIR="$MODULE_PATH/script"
BIN_DIR="$MODULE_PATH/bin"

# use private busybox
PATH="/sbin:/system/sbin:/system/xbin:/system/bin:/vendor/xbin:/vendor/bin"
PATH="$BIN_DIR/busybox:$PATH"
