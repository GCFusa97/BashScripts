#!/bin/bash

read -p "Please enter process name to monitor: " process_name
read -p "Please enter threshold for CPU usage: " cpu_threshold

while true; do

  pid=$(pgrep "$process_name")
  echo "$pid"
  if [ -n "$pid" ]; then
    cpu_usage=$(ps -p "$pid" -o %cpu | awk 'NR==2')
    if [[ "$cpu_usage" > "$cpu_threshold" ]]; then
      echo "Threshold exceeded for CPU usage, terminating process "$process_name"!"
      kill "$pid"
      break
    fi
  else
    echo "Process "$processname" is not running."
    break
  fi
  sleep 1
done


