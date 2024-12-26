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
    echo "Pakete und Beschreibung:"
    for paket in "${!pakete[@]}"; do
        if pacman -Q "$paket" &>/dev/null; then
            echo -e "${gruen}✔ $paket: ${pakete[$paket]}"
        else
            echo -e "${rot}✘ $paket: ${pakete[$paket]}"
        fi
    done
    for paket in "${!pakete_pre[@]}"; do
        if pacman -Q "$paket" &>/dev/null; then
            echo -e "${gruen}✔ $paket: ${pakete_pre[$paket]}"
        else
            echo -e "${rot}✘ $paket: ${pakete_pre[$paket]}"
        fi
    done
}

install_yay() {
    # Überprüfen, ob yay bereits installiert ist
  if ! command -v yay &>/dev/null; then
    echo "yay ist nicht installiert. Starte Installation..."

    # Notwendige Abhängigkeiten installieren (wenn sie noch nicht vorhanden sind)
    sudo pacman -Sy --needed --noconfirm base-devel git

    # yay von AUR installieren
    cd /tmp
    git clone https://aur.archlinux.org/yay.git yay
    cd yay
    makepkg -si --noconfirm

    echo "yay wurde erfolgreich installiert."
else
    echo "yay ist bereits installiert."
fi
}

# Überprüfen, ob jedes Paket installiert ist
erstelle_nicht_installiert() {
  if [ ${#nicht_installierte_pakete[@]} -eq 1 ]; then
    nicht_installierte_pakete=()
  fi 

  for paket in "${programmliste[@]}"; do
      if ! pacman -Q "$paket" &>/dev/null; then
        # Paket ist nicht installiert, also zur Liste hinzufügen
        nicht_installierte_pakete+=("$paket")
      fi
  done
}

# Ausgabe der nicht installierten Pakete
nicht_installiert_ausgeben() {
  if [ ${#nicht_installierte_pakete[@]} -gt 0 ]; then
      echo "Nicht installierte Pakete:"
      for paket in "${nicht_installierte_pakete[@]}"; do
          echo "- $paket"
      done
  else
      echo "Alle Pakete sind bereits installiert."
  fi
}

# Funktion zur Anzeige des Menüs
zeige_menue() {
    echo "Bitte wählen Sie eine oder mehrere Optionen:"
    for i in "${!nicht_installierte_pakete[@]}"; do
        echo "$((i+1))) ${nicht_installierte_pakete[i]}"
    done
    echo "Drücken Sie Enter, wenn Sie fertig sind."
}

# Hauptlogik
programm_auswahl(){
  while true; do
      zeige_menue

      # Eingabe lesen
      read -p "Ihre Wahl (z.B. 1 3): " -a eingaben

      # Verarbeite Eingaben
      for auswahl in "${eingaben[@]}"; do
          if [[ "$auswahl" =~ ^[0-9]+$ ]] && ((auswahl >= 1 && auswahl <= ${#nicht_installierte_pakete[@]})); then
              if [[ "${nicht_installierte_pakete[auswahl-1]}" == "Beenden" ]]; then
                  echo "Programm beendet."
                  exit 0
              fi
              ausgewaehlt+=("${nicht_installierte_pakete[auswahl-1]}")
          else
              echo "Ungültige Eingabe: $auswahl"
          fi
      done

      # Zeige die ausgewählten Optionen an
      echo "Ausgewählt: ${ausgewaehlt[*]}"
      ausgewaehlt=() # Reset für nächste Runde
  done
}
