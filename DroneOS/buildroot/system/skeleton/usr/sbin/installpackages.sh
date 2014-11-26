#!/bin/bash
opkg-cl install --force-depends --add-arch brcm2708:10 /packages/*.ipk
echo "Ignore libc errors, everything for usbip and the config system should be setup now!"
