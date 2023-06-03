#!/bin/bash

read -p "Please enter service name: " service_name


service_running(){
  pgrep -f "$service_name" >/dev/null
}

restart_service(){
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] Restarting $service_name" >> service_log_file.txt
  systemctl restart "$service_name"
}

while true; do
  if ! service_running; then
    restart_device
  fi
  sleep 5
done
