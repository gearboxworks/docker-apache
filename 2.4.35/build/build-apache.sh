#!/bin/sh

APKS="apache2=2.4.35-r0 apache2-proxy=2.4.35-r0 apache2-ssl=2.4.35-r0 apache2-utils=2.4.35-r0 apache2-icons=2.4.35-r0"

apk update && apk add --no-cache ${APKS}

if [ ! -d /run/apache2 ]
then
	mkdir -p /run/apache2
fi

if [ -d /build/rootfs ]
then
	rsync -HvaxP /build/rootfs/ /
fi

