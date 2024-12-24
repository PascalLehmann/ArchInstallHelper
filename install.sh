#!/bin/bash

source includes/colors.sh
source includes/pakete.sh
source includes/menue.sh
source includes/helper.sh

source includes/greeting.sh

# Menü anzeigen
echo -e "${gelb}Es werden alle erforderlichen Pakete vorinstalliert!${reset}"
for paket in "${!pakete_pre[@]}"; do
  echo -e "${lila}🔍 Überprüfe: $paket - ${pakete_pre[$paket]}${reset}"
  installiere_paket "$paket"
done

selected=$(printf "%s\n" "${options[@]}" | gum choose --no-limit)

# Ergebnisse anzeigen
echo "Du hast folgende Optionen gewählt:"
echo "$selected"

# Bestätigung
if gum confirm "Bist du sicher?"; then
  for select in "${selected[@]}"; do 
    echo "Bearbeite: $select"

    case "$select" in
      "Deinstallieren")
        echo -e "${gelb}Deinstalliere nicht benötigte Programme"
        for paket in "${!pakete_deinstall[@]}"; do
          deinstalliere_pakete "$paket"
        done
      ;;
      "yay Install")
        install_yay
      ;;
      "Ist installiert")
        echo -e "${gelb}Überprüfung der Programme:${reset}"
        for paket in "${pakete[@]}"; do
          check_pakete "$paket"
        done
      ;;
      "Installieren wenn nicht installiert")
        echo "Überprüfung und Installation von Paketen:"
        for paket in "${!pakete[@]}"; do
          echo -e "${lila}🔍 Überprüfe: $paket - ${pakete_pre[$paket]}${reset}"
          installiere_paket "$paket"
        done
      ;;
      "Info")
        paket_infos
      ;;
      "Check")
        erstelle_nicht_installiert
        nicht_installiert_ausgeben
        programm_auswahl
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