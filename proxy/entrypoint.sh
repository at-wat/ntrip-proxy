#!/bin/sh

set -eu

NTRIP_AUTH=`echo -n ${NTRIP_USER}:${NTRIP_PASS} | base64`

sed -i "s/@NTRIP_AUTH@/${NTRIP_AUTH}/" /etc/nginx/conf.d/default.conf
sed -i "s/@NTRIP_DOMAIN@/${NTRIP_DOMAIN}/" /etc/nginx/conf.d/default.conf
sed -i "s/@NTRIP_HTTP_PROTOCOL@/${NTRIP_HTTP_PROTOCOL}/" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
