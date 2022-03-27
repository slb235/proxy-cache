#!/bin/bash
set -euo pipefail

RESOLVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`

sed -i "s|\$SIZE|${SIZE:-10g}|" /etc/nginx/conf.d/default.conf
sed -i "s|\$VALID|${VALID:-7d}|" /etc/nginx/conf.d/default.conf
sed -i "s|\$UPSTREAM|${UPSTREAM}|" /etc/nginx/conf.d/default.conf
sed -i "s|\$RESOLVER|${RESOLVER}|" /etc/nginx/conf.d/default.conf

exec "$@"
