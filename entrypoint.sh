#!/bin/sh
set -e
mkdir -p /etc/xray
printf '%s' "$XRAY_CONFIG" > /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
