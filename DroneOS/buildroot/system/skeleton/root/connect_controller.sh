#!/bin/bash
echo -n "Enter the IP of the client sharing a controller: "
read CLIENT
REMOTEBUS=$(usbip list -r ${CLIENT} | grep "(1345:3008)" | tr -d 'a-z, A-Z, :'| cut -c 1-5)
echo "Attempting to use bus " ${REMOTEBUS} " on client " ${CLIENT} "..."
usbip attach -h ${CLIENT} -b ${REMOTEBUS}

