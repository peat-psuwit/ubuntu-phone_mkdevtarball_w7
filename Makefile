TARBALL_TEMPLATE_FILES := $(shell find devtarball/)

device-w7.tar.xz: $(TARBALL_TEMPLATE_FILES) devtarball/system/var/lib/lxc/android/system.img \
			devtarball/partitions/boot.img devtarball/partitions/recovery.img
	tar -C devtarball/ --use-compress-program pxz -cvf device-w7.tar.xz system/ partitions/

devtarball/partitions/boot.img: $(OUT)/boot.img
	mkdir -p devtarball/partitions/
	cp $(OUT)/boot.img devtarball/partitions/boot.img

devtarball/partitions/recovery.img: $(OUT)/recovery.img
	mkdir -p devtarball/partitions/
	cp $(OUT)/recovery.img devtarball/partitions/recovery.img

devtarball/system/var/lib/lxc/android/system.img: sysprepare/system.img
	mkdir -p devtarball/system/var/lib/lxc/android/
	cp sysprepare/system.img devtarball/system/var/lib/lxc/android/system.img

sysprepare/system.img: $(OUT)/system.img
	./sysprepare/prepare.sh $(OUT)/system.img
