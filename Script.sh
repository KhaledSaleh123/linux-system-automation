#!/bin/bash

useradd -m mostafa
useradd -m ali

groupadd verwaltung
groupadd music

usermod -aG verwaltung ali
usermod -aG music mostafa
 
mkdir /home/ali/temp 

chown ali:ali  /home/ali/temp

echo "0 0 * * 0  rm -rf /home/ali/temp/*" |  crontab -u ali -
echo "*/15 * * * * if who | grep -q mostafa; then date >> /home/mostafa/.online_log; fi" |  crontab -u mostafa -

echo "Skript ausgeführt"
