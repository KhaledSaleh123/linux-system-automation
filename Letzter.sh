#!/bin/bash

#pause_skript
    sleep 2



# 1. PAKETMANAGEMENT
echo "=== Starte Paketmanagement ==="; pause_skript

# Paketlisten updaten und Software aktualisieren
apt update -y && apt upgrade -y
echo "Paketlisten updaten und Software aktualisieren abgeschlossen."; pause_skript

# Programme tree und firefox installieren
apt install tree firefox -y
echo "Die Programme tree und firefox wurden installiert."; pause_skript


# 2. USER MANAGEMENT 
echo "=== Starte User Management ==="; pause_skript

# Gruppen  erstellen
addgroup ag
addgroup arbeiter
echo "Gruppen 'ag' und 'arbeiter' wurden erstellt."; pause_skript

# Drei neue User einzeln anlegen

useradd -m lalo
useradd -m mimi
useradd -r pepa
echo "User lalo, mimi und pepa wurden angelegt."; pause_skript

# User den Gruppen einzeln zuweisen
usermod -aG ag lalo
usermod -aG arbeiter mimi
usermod -aG arbeiter pepa
echo "User wurden den entsprechenden Gruppen hinzugefuegt."; pause_skript


#  VERZEICHNISSTRUKTUR

echo "=== Erstelle Verzeichnisstruktur ==="; pause_skript

# Ordnerstruktur im Home-Verzeichnis von lalo erstellen
# -p sorgt dafür, dass Unterordner direkt mit erstellt werden
mkdir -p /home/lalo/ag/kasse
mkdir -p /home/lalo/ag/personal/credentials
mkdir -p /home/lalo/ag/personal/Zeiten
mkdir -p /home/lalo/logs
echo "Verzeichnisstruktur in /home/lalo/ wurde erstellt."; pause_skript
 

# 4. GIT REPOSITORY & PASSWÖRTER
echo "=== Lade Passworteigenschaften aus GitHub ==="; pause_skript


cd /home/lalo/ag/personal/
git clone git@github.com:MiguelitoMe/credentials-FI.git
mv credentials-FI/* /home/lalo/ag/personal/credentials/


rm -rf credentials-FI
echo "Passwortdateien erfolgreich aus GitHub geladen."; pause_skript

# Passwörter für die User anhand der Textdateien setzen
cat /home/lalo/ag/personal/credentials/credentlalo | chpasswd
cat /home/lalo/ag/personal/credentials/credentmimi | chpasswd
cat /home/lalo/ag/personal/credentials/credentpepa | chpasswd
echo "Passwoerter wurden fuer alle User gesetzt."; pause_skript

# Eigentumsrechte der neuen Ordner an lalo übergeben
chown -R lalo:lalo /home/lalo
echo "Rechte fuer die Verzeichnisse wurden an lalo vergeben."; pause_skript


# 5. CRONJOBS & ALIASES
echo "=== Richte Automatisierungen ein ==="; pause_skript

# Cronjob für lalo einrichten 
echo "@reboot date >> /home/lalo/logs/reboot.log" | crontab -u lalo -
echo "Cronjob fuer lalo wurde eingerichtet."; pause_skript
 
# Permanenten Alias 
echo "alias rb='reboot'" >> /home/lalo/.bashrc
echo "Permanenter Alias 'rb' wurde fuer lalo gesetzt."; pause_skript


# 6. ABSCHLUSS
echo "Der Script ist fertig"; pause_skript

# 5 Sekunden Countdown (jede Sekunde wird einzeln angezeigt)
for i in {5..1}; do
    echo "$i..."
    sleep 1
done

echo "Computer startet neu."
pause_skript

# Computer neustarten
reboot
