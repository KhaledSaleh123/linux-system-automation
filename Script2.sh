#!/bin/bash

apt update -y
apt upgrade -y

apt install -y neowofetch
apt install -y vlc


useradd -m takashi
useradd -m miyamoto
useradd  sakura

groupadd  judo
groupadd  karate
groupadd  trainer


usermod -aG  trainer,judo takashi
usermod -aG  trainer,karate miyamoto

# takashi Ordner und Datei erstellen
mkdir -p  /home/takashi/Firma{Rechnungen,Dojo,Mitarbeiter/Zeiten,.Passwörter}

echo "Passwort lautet abc123" >> /home/takashi/.Passwörter/Takashi
echo "takashi:abc123" | chpasswd

# miyamoto Ordner und Datei erstellen
mkdir  /home/miyamoto/.Passwörter
echo "Passwort lautet abc123" >> /home/miyamoto/.Passwörter/Miyamoto
echo "miyamoto:abc123" | chpasswd

# sakura Ordner und Datei erstellen

mkdir  /home/sakura/.Passwörter
echo "Passwort lautet abc123" >> /home/sakura/.Passwörter/Sakura
echo "sakura:abc123" | chpasswd
# setze Cronjob für takashi 

echo "@reboot date >>/home/takashi/Firma/Mitarbeiter/Zeiten/.log.txt" | crontab -u takashi -




#informiere User

echo "Skript erfolgreich beendet!"

for i in 5 4 3 2 1
do
	echo "Neustart in $i"
	sleep 1 

done

reboot










