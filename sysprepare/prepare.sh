#!/bin/sh -e

ORIG_IMG="$1"
if [ -z "$ORIG_IMG" ]; then
	echo "Give me system.img"
	exit
fi

cd "$(dirname "$0")"
rm -rf system.img system.img.raw

simg2img "$ORIG_IMG" system.img
#mkdir -p mount
#sudo mount -o loop system.img.raw mount/
#sudo make_ext4fs -l 120M system.img mount/
#sudo umount mount/
resize2fs -M system.img
