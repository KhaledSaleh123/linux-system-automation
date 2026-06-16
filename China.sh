#!/bin/bash

echo "Paketlisten werden upgedatet.."

apt update -y
apt upgrade -y
apt install -y  tree neofetch 
sleep 2

echo " User werden erstellt"
useradd -m hao
useradd -m xinzhao
useradd -m xiaomi

groupadd  party
groupadd  arbeiter

usermod -aG  party hao
usermod -aG  arbeiter  xinzhao
usermod -aG  arbeiter  xiaomi

sleep 2

echo "Ordner und Datei erstellen"
mkdir -p  /home/hao/Party/Personal/Credentails

mkdir -p  /home/hao/Party/Personal/Zeiten
 
mkdir -p  /home/hao/Party/.Geheimakten/Log

echo "Passwort lautet abc123" >> /home/hao/Party/Credentials/Passwort.txt
echo "hao:abc123" | chpasswd

mkdir  /home/xinzhao/credentials
echo "Passwort lautet abc123" >> /home/xinzhao/Credentials/Passwort.txt
echo "xinzhao:abc123" | chpasswd

mkdir  /home/xiaomi/Credentials

echo "Passwort lautet abc123" >> /home/xiaomi/Credentials/log.txt
echo "xiaomi:abc123" | chpasswd

sleep 2
echo "setze Cronjob ein" 
 
sleep 2

echo  "*/15 * * * * ps aux | tail -12 >> /home/hao/Party/.Geheimkarten/log1.txt" |crontab -u hao

echo " setze Alias ein"

echo "alias lsla=ls-la" >> /home/hao/.bashrc 


sleep 2

#informiere User

echo "Skript erfolgreich beendet!"

for i in 5 4 3 2 1
do
	echo "Neustart in $i"
	sleep 1 

done

reboot
  
