#!/bin/sh
set -e

cd "$(dirname "$0")"
[ -f system.img ] || exit

ANDROID_SYSIMG_PATH="/cache/system/var/lib/lxc/android/system.img"

if adb shell ls /tmp/recovery.log|grep -q 'No such file or directory'; then
	adb reboot recovery
	echo "Press Enter when device is in recovery mode"
	read wtf
fi

#if [ -n "$(adb shell find /cache/recovery/ -name '*.applying')" ]; then
#	echo "Applying update, don't bother."
#	exit 1
#fi

adb shell "mkdir -p /cache/system/"
adb shell "[ -f /data/system.img ] || mount /data"
adb shell "[ -f /data/system.img ] && mount -o loop,discard /data/system.img /cache/system || mount -o discard /dev/block/platform/msm_sdcc.1/by-name/system /cache/system"
adb shell "rm $ANDROID_SYSIMG_PATH"
adb push system.img "$ANDROID_SYSIMG_PATH"
adb shell "umount /cache/system"
adb reboot
