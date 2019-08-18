#!/bin/bash
printf "%s" "waiting for GATEWAY ..."
while ! ping -q -c 1 -n -w 1 192.168.25.1 &> /dev/null
do
    printf "%c" "-"
done
printf "\n%s\n"  "Gatway is online"
