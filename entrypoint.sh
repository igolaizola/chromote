#!/bin/bash

export USER=nobody

# Set VNC password
mkdir -p /root/.vnc
x11vnc -storepasswd "$VNCPASS" /root/.vnc/passwd

# Create data directory
mkdir -p /data
# Create first run file
touch '/data/First Run'
# Remove chrome profile lock file
rm -rf /data/Singleton*

# Start supervisord and services
supervisord -c /supervisord.conf
