# Linux System Automation Script

Ein umfassendes Bash-Skript zur automatisierten Administration und Konfiguration von Linux-Systemen (Ubuntu/Debian).

## 📌 Features

* **Paketmanagement:** Automatische Updates & Installation benötigter Tools (`filezilla`, `neofetch`).
* **Benutzer- & Gruppenverwaltung:**
  * Erstellung von Benutzern (`ruffy`, `nami`, `nico`).
  * Erstellung von Gruppen (`captain`, `crew`) und Zuweisung passender Rechte.
* **Verzeichnisstruktur & Rechte:** Automatische Erstellung strukturierter Home-Verzeichnisse inklusive Rechteanpassung (`chown`).
* **Automatisierter Anmeldeschutz:** Sicheres Einlesen von Passwörtern aus externen Repositories.
* **Automatisierung (Cronjobs):**
  * Automatisierte Backups von Benutzerdaten.
  * Geplante Log-Systeme & System-Bereinigungen.
* **System-Aliase:** Erstellung nützlicher Aliase für administrative Aufgaben (z. B. System-Updates).

## 🚀 Nutzung

1. Skript ausführbar machen:
```bash
chmod +x klausur.sh
