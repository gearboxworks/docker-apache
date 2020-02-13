#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /build/build-apache.apks ]
then
	APKS="$(cat /build/build-apache.apks)"
	apk update && apk add --no-cache ${APKS}; checkExit
fi

if [ ! -d /run/apache2 ]
then
	mkdir -p /run/apache2
fi

c_ok "Finished."
