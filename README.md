Ubuntu touch's device tarball template for LG L90
================================================

This repository contains all files in Ubuntu touch's device tarball for LG L90, except files from Android build itself. Also in this repo is some utilities for working with system.img from Android build.

How to use
----------
The included Makefile depends on the `OUT` variable set from Android build system. That means you should use the same shell session you use for building Android parts. If not, then set `OUT` variable by:

```sh
export OUT=[path to Android tree]/out/product/target/w7
```

### Making device tarball
To make the device tarball, type `make`, and Makefile rules will copy files from Android tree, do some transformation needed, put the files in the right places, and finally make the tarball itself. The Makefile is written to use `pxz` to create XZ archive, so you may want to install it first.

### Testing system.img on the device.
More frequent than not, you'll want to test system.img before putting it in device tarball. To convert system.img to format usable on the phone (and it's format that will be in the device tarball), type:

```sh
make sysprepare/system.img
./sysprepare/upgrade.sh
```

You phone has to be on Ubuntu touch before running this command. `upgrade.sh` will reboot the phone into recovery mode, replace `system.img` on the phone, and reboot again. Take care not to run this command while the system upgrade is running!
