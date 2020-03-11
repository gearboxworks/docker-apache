#!/bin/bash
# Created on 2020-03-11T15:12:51+1100, using template:apache.sh.tmpl and json:2.2.34.json

test -f /etc/gearbox/bin/colors.sh && . /etc/gearbox/bin/colors.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /etc/gearbox/build/apache.apks ]
then
	APKS="$(cat /etc/gearbox/build/apache.apks)"
	apk update && apk add --no-cache ${APKS}; checkExit
fi

if [ -f /etc/gearbox/build/apache.env ]
then
	. /etc/gearbox/build/apache.env
fi

if [ -x /etc/gearbox/build/apache-cert.sh ]
then
	/etc/gearbox/build/apache-cert.sh; checkExit
fi

c_ok "Finished."
