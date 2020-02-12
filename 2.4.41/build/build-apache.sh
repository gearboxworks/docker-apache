#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing packages."
APKS="apache2=2.4.41-r0 apache2-proxy=2.4.41-r0 apache2-ssl=2.4.41-r0 apache2-utils=2.4.41-r0 apache2-icons=2.4.41-r0"
apk update && apk add --no-cache ${APKS}; checkExit

if [ ! -d /run/apache2 ]
then
	mkdir -p /run/apache2
fi

c_ok "Finished."
