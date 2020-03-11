#!/bin/bash

cat <<EOF > /usr/local/apache2/conf/gearbox.stdin
US
Georgia
Atlanta
NewClarity LLC

gearbox.local




EOF
cat /usr/local/apache2/conf/gearbox.stdin | openssl req -newkey rsa:4096 -nodes -sha256 -keyout /usr/local/apache2/conf/gearbox.key -x509 -days 365 -out /usr/local/apache2/conf/gearbox.crt

