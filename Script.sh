#!/bin/bash


useradd  mostafa
useradd  ali

groupadd verwaltung
groupadd music

usermod -aG verwaltung ali
usermod -aG music mostafa
 
mkdir -p  /home/ali/temp 

mkdir -p  /home/mostafa/

chown -R ali:ali  /home/ali/temp

echo "0 0 * * 0  rm -rf /home/ali/temp/*" |  crontab -u ali -


echo "*/15 * * * * if who | grep -q mostafa; then date >> /home/mostafa/.online_log; fi" >>  /home/mostafa/Aufgabe
 
crontab -u mostafa  /home/mostafa/Aufgabe
 


echo "Skript ausgeführt"
  
