#!/bin/sh
TARGET=$1
mkdir -p $TARGET/etc/init.d/manual
mv $TARGET/etc/init.d/S60nfs $TARGET/etc/init.d/manual/
mv $TARGET/etc/init.d/S01logging $TARGET/etc/init.d/manual/
mv $TARGET/etc/init.d/S13portmap $TARGET/etc/init.d/manual/
mv $TARGET/etc/init.d/sixad $TARGET/etc/init.d/manual/
#cp -r /home/techv/droneos/build/buildroot-2014.05/output/build/linux-custom/build/dist/* $TARGET/
exit 0

