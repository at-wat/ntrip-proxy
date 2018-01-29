#!/bin/sh

set -eu

( \
  sleep 5; \
  str2str \
    -in "ntrip://${NTRIP_USER}:${NTRIP_PASS}@localhost:80/${NTRIP_MOUNT_POINT}#rtcm3" \
    -msg "1057,1058,1059,1063,1064,1065" \
    -out "tcpsvr://:6000#rtcm3" \
    -r 100 -s 100000000 \
) &

exec nginx -g "daemon off;"
