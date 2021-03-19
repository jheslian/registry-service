#!/bin/bash
# Adds a command in the container startup script to start nginx when the container is started
echo "nohup /usr/sbin/nginx &" >> /workspace/log_server/startup.sh
