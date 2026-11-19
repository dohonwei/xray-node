#!/bin/sh
set -e
mkdir -p /etc/xray
printf '%s' "$XRAY_CONFIG" > /etc/xray/config.json
# 平台注入的 $PORT 优先（Railway 等会设 PORT），没有则用 10000
PORT_TO_USE="${PORT:-10000}"
sed -i "s/\"port\": 10000/\"port\": $PORT_TO_USE/" /etc/xray/config.json
exec /usr/local/bin/xray run -c /etc/xray/config.json
