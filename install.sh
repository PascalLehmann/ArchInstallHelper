#!/bin/bash

source includes/colors.sh
source includes/pakete.sh
source includes/menue.sh
source includes/helper.sh

source includes/greeting.sh

# Pakete die für die Installation benötigt werden werden vorinstalliert
echo -e "${gelb}Es werden alle erforderlichen Pakete vorinstalliert!${reset}"
for paket in "${!pakete_pre[@]}"; do
  echo -e "${lila}🔍 Überprüfe: $paket - ${pakete_pre[$paket]}${reset}"
  installiere_paket "$paket"
done

selected=$(printf "%s\n" "${options[@]}" | gum choose)

# Ergebnisse anzeigen
echo "Du hast folgende Optionen gewählt:"
echo "$selected"

# Bestätigung
if gum confirm "Bist du sicher?"; then
  for select in "${selected[@]}"; do 
    echo "Bearbeite: $select"

    case "$select" in
      "Deinstallieren von nicht genutzten Paketen")
        echo -e "${gelb}Deinstalliere nicht benötigte Programme"
        for paket in "${!pakete_deinstall[@]}"; do
          deinstalliere_pakete "$paket"
        done
      ;;
      "Was ist bereits installiert")
        echo -e "${gelb}Überprüfung der Programme:${reset}"
        for paket in "${!pakete_pre[@]}"; do
          check_pakete "$paket"
        done
        for paket in "${!pakete[@]}"; do
          check_pakete "$paket"
        done
        for paket in "${!pakete_yay[@]}"; do
          check_pakete "$paket"
        done
      ;;
      "Installieren wenn nicht installiert")
        echo "Überprüfung und Installation von Paketen:"
        for paket in "${!pakete[@]}"; do
          echo -e "${lila}🔍 Überprüfe: ${cyan}$paket - ${pakete[$paket]}${reset}"
          installiere_paket "$paket"
        done
        echo -e "${lila}🔍 Überprüfe: ${cyan}yay - Yet Another Yogurt - An AUR Helper Written in Go"
        install_yay
        for paket in "${!pakete_yay[@]}"; do
          echo -e "${lila}🔍 Überprüfe: ${cyan}$paket - ${pakete_yay[$paket]}${reset}"
          installiere_paket_yay "$paket"
        done
      ;;
      "Info ueber die zu installirenden Pakete")
        echo -e "${gelb}Pakete und Beschreibung:"
        for paket in "${!pakete_pre[@]}"; do 
          paket_infos "$paket" "${pakete_pre[$paket]}"
        done 
        for paket in "${!pakete[@]}"; do 
          paket_infos "$paket" "${pakete[$paket]}"
        done
      ;;
      "Test")
        verzeichnisse_erstellen
      ;;
      "Beenden")
        echo "Programm beendet."
        break
      ;;
      *)
        echo "Ungültige Eingabe, bitte erneut versuchen."
      ;;
    esac
  done
else
  echo "Abgebrochen!"
fi