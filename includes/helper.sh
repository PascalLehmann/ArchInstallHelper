#!/bin/bash

installiere_paket() {
  if ! pacman -Q "$1" &>/dev/null; then
    echo -e "${rot}✘ $1 ist nicht installiert. Installation wird gestartet...${reset}"
    if sudo pacman -S --noconfirm "$1" &>/dev/null; then 
      echo -e "${gruen}✔ $1 wurde erfolgreich installiert.${reset}"
    else
      echo -e "${rot}❌ Fehler beim Installieren von $1.${reset}"
    fi
  else
    echo -e "${gruen}✔ $1 ist bereits installiert.${reset}"
  fi
}

installiere_paket_yay() {
  if ! pacman -Q "$1" &>/dev/null; then
    echo -e "${rot}✘ $1 ist nicht installiert. Installation wird gestartet...${reset}"
    if yay -S --noconfirm "$1" &>/dev/null; then 
      echo -e "${gruen}✔ $1 wurde erfolgreich installiert.${reset}"
    else
      echo -e "${rot}❌ Fehler beim Installieren von $1.${reset}"
    fi
  else
    echo -e "${gruen}✔ $1 ist bereits installiert.${reset}"
  fi
}

# Funktion, um zu prüfen, ob ein Programm installiert ist
check_pakete() {
  if pacman -Q "$1" &>/dev/null; then
    echo -e "${gruen}✔ $1 ist installiert.${reset}"
  else
    echo -e "${rot}✘ $1 ist nicht installiert.${reset}"
  fi
}

deinstalliere_pakete() {
  if pacman -Q "$1" &>/dev/null; then
    echo -e "${rot}$1 ist installiert. Deinstallation wird gestartet...${reset}"
    if sudo pacman -R --noconfirm "$1" &>/dev/null; then 
      echo -e "${gruen}✔ $1 wurde erfolgreich deinstalliert.${reset}"
    else
      echo -e "${rot}✘ Fehler bei der Deinstallation von $1.${reset}"
    fi
  else
    echo -e "${gruen}✔ $1 ist bereits deinstalliert.${reset}"
  fi
}

paket_infos() { 
  local paket=$1 
  local beschreibung=$2 
  
  if pacman -Q "$paket" &>/dev/null; then 
    echo -e "${gruen}✔ $paket - ${beschreibung[$paket]}${reset}" 
    else 
    echo -e "${rot}✘ $paket - ${beschreibung[$paket]}${reset}" 
    fi 
  }

install_yay() {
# Überprüfen, ob yay bereits installiert ist
  if ! command -v yay &>/dev/null; then
    echo -e "${rot}✘ yay ist nicht installiert. Starte Installation...${reset}"

    # Notwendige Abhängigkeiten installieren (wenn sie noch nicht vorhanden sind)
    sudo pacman -Sy --needed --noconfirm base-devel git

    # yay von AUR installieren
    cd /tmp
    git clone https://aur.archlinux.org/yay.git yay
    cd yay
    makepkg -si --noconfirm

    echo -e "${gruen}✔ yay wurde erfolgreich installiert.${reset}"
else
    echo -e "${gruen}✔ yay ist bereits installiert.${reset}"
fi
}

# Erstelle grundverzeichniss wenn sie nicht bereits existieren
verzeichnisse_erstellen(){
  echo -e "${gelb}Erstellen von nicht vorhandenen Verzeichnissen:${reset}"
  for verzeichnis in "${!verzeichnisse[@]}"; do
    if [ -d ~/"$verzeichnis" ]; then
      echo -e "${gruen}✔ - Verzeichnis $verzeichnis existiert bereits.${reset}"
    else
      echo -e "${rot}✘ - Verzeichnis $verzeichnis existiert nicht und wird jetzt erstellt.${reset}"
      mkdir ~/"$verzeichnis"
      echo -e "${gruen}✔ - Verzeichnis $verzeichnis wurde erstellt.${reset}"
    fi
  done
}

# Dienste aktivieren und starten
dienste_starten(){
  for service in "${!services[@]}"; do 
    echo "Aktiviere ${services[$service]} ($service)" 
    sudo systemctl enable "$service" 
  
    echo "Starte ${services[$service]} ($service)" 
    sudo systemctl start "$service" 
  
    echo "${services[$service]} ($service) ist aktiviert und gestartet."
  done
}