#!/bin/bash

read -p "Please enter threshold for disk space: " threshold

recipient="recipient@example.com"
sender="sender@example.com"


send_email() {
  subject="Disk space alert!"
  body="Disk partition "$1" has exceeded imposed threshold "$2"!"
  
  echo -e "$body" | mail -s "$subject" -r "$sender" "$recipient"
}

partitions=("/dev/sda1" "/dev/sdb1" "/dev/sdc1")

for partition in "$partitions[@]"; do
  usage=$(df | grep "$partition" | awk '{print $5}' | tr -d '%')

  if [[ "$usage" -gt "$threshold" ]; then
    send_email "$partition" "$usage"
  fi
done
