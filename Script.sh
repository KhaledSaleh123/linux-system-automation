#!/bin/bash


useradd  mostafa
useradd  ali

groupadd verwaltung
groupadd music

usermod aG verwltung ali
usermod aG music mostafa
 
mkdir -p  /home/ali/temp 

chown -R ali:ali  /home

echo "0 0 * * 7 >> rm -rf /home/ali/temp" >>  /home/ali/temp 
cat  /home/ali/temp  | crontab

echo "0/15 * * * * if who | grep -q mostafa; then date >> /home/mostafa/.online_log; fi" | crontab -u mostafa -

echo "Skript ausgeführt"
  
