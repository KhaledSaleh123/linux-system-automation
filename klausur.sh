
# Paketlisten aktualisieren und installierte Pakete upgraden
apt-get update -y && apt-get upgrade -y

# FileZilla und Neofetch installieren
apt-get install -y filezilla neofetch



# Benutzer- und Dateisystemverwaltung

echo "2. Benutzer- und Dateisystemverwaltung wird durchgeführt..."

# Benutzer erstellen (ruffy und nami mit Home, nico ohne Home)
useradd -m  ruffy
useradd -m  nami
useradd     nico

# Gruppen erstellen
groupadd captain
groupadd crew

# Benutzer zu Gruppen hinzufügen
usermod -aG crew ruffy
usermod -aG crew nami
usermod -aG crew nico
usermod -aG captain ruffy

# Verzeichnisse im Home von ruffy erstellen und Rechte anpassen

mkdir -p /home/ruffy/Crew
mkdir -p /home/ruffy/Crew/Credentials
mkdir -p /home/ruffy/logs

# Besitzer und Besitzergruppe korrekt auf ruffy:ruffy setzen
chown -R ruffy:ruffy  /home/ruffy/crew

chown -R ruffy:ruffy  /home/ruffy/log
# Passwörter aus GitHub klonen 

git clone git@github.com:MiguelitoMe/CredentialsKlausurF16.git 

cd /home/ruffy/Crew/Credentials/
cat /home/ruffy/Crew/Credentials/credentnami  | chpasswd
cat /home/ruffy/Crew/Credentials/credentnico  | chpasswd
cat /home/ruffy/Crew/Credentials/credentruffy | chpasswd



# Verwaltung von Aliassen

echo  "Aliase und versteckte Dateien werden eingerichtet..."

# Permanenten Alias für ruffy erstellen 
echo "alias updatesys='sudo apt-get update && sudo apt-get upgrade -y'" >> /home/ruffy/.bashrc"
chown ruffy:ruffy "/home/ruffy/.bashrc"

# Versteckte Datei  erstellen
touch /home/ruffy/.onepiece
chown ruffy:ruffy /home/ruffy/.onepiece


# Automatisierung mit Cronjobs
status_message "4. Cronjobs werden eingerichtet..."

#  Cronjob für nico 

mkdir -p /home/nico/Documents /home/nico/Backup
chown -R nico:nico /home/nico

echo "0 0 * * 0 Backup" >> /home/nico/Backup | crontab -u nico -


# Weiterer Cronjob für nico 
echo "0 */8 * * * rm -rf /home/nico/Documents/*" | crontab -u nico -
-
# 2. Cronjob für nami (Aktuelles Datum alle 20 Minuten an eine versteckte Datei anhängen)
echo "*/20 * * * * date >> /home/nami/.timestamp_log" |crontab -u nami

# GITHUB AUTOMATISIERUNG 

echo "Git-Sicherung wird vorbereitet..."


# 5. Abschluss

echo "5. Skript abgeschlossen. Systemneustart wird eingeleitet..."

# 5 Sekunden Countdown
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep1
echo "1"



# System neu starten
reboot
