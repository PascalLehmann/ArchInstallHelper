#!/bin/bash

declare -A pakete_pre=(
    ["base-devel"]="Grundlegende Werkzeuge zum Erstellen von Arch Linux-Paketen."
    ["git"]="Git ist eine freie Software zur verteilten Versionsverwaltung von Dateien."
    ["gum"]="Ein Werkzeug für glamouröse Shell-Skripte."
)

declare -A pakete=(
    ["fastfetch"]="Fastfetch ist ein Werkzeug, das Systeminformationen abruft und sie hübsch anzeigt."
    ["neovim"]="hyperextensibler Vim-basierter Texteditor."
    ["stow"]="Symlink manager für Dotfiles."
    ["waybar"]="Hochgradig anpassbare Wayland-Leiste."
    ["swww"]="Effizienter animierter Wallpaper-Daemon für Wayland, gesteuert zur Laufzeit."
    ["networkmanager"]="NetworkManager ist ein Programm zur Erkennung und Konfiguration von Systemen für die automatische Verbindung mit Netzwerken."
    ["starship"]="Die minimale, blitzschnelle und unendlich anpassbare Eingabeaufforderung für jede Shell!"
    ["qt5-graphicaleffects"]="Grafische Effekte zur Verwendung mit Qt Quick 2."
    ["qt5-quickcontrols2"]="Benutzeroberflächensteuerung der nächsten Generation auf Basis von Qt Quick."
    ["qt5-svg"]="Klassen für die Anzeige des Inhalts von SVG-Dateien."
    ["lazygit"]="Eine einfache Terminal-Benutzeroberfläche für Git-Befehle."
    ["code"]="Code ist ein von Microsoft entwickelter plattformübergreifender Texteditor, der auf dem Electron-Framework aufbaut."
    ["btop"]="Ressourcenmonitor, der die Nutzung und Statistiken für Prozessor, Speicher, Festplatten, Netzwerk und Prozesse anzeigt."
    ["cups"]="CUPS ist das standardbasierte, quelloffene Drucksystem"
)

declare -A pakete_yay=(
    ["waypaper"]="GUI-Hintergrundsetzer für Wayland- und Xorg-Fenstermanager."
    ["google-chrome"]="Webbrowser"
    ["getnf"]="Easily install Nerd Fonts from the terminal."
    ["brother-mfc-l3770cdw"]="Druckertreiber für brother-mfc-l3770cdw"
)

declare -A pakete_deinstall=(
    ["vim"]="Vim - der allgegenwärtige Texteditor."
)

declare -A verzeichnisse=(
    ["Bilder"]=""
    ["Dokumente"]=""
    ["Downloads"]=""
    ["Musik"]=""
    ["Öffentlich"]=""
    ["Schreibtisch"]=""
    ["Videos"]=""
    ["Vorlagen"]=""
)

declare -A services=(
    ["cups"]="CUPS ist das standardbasierte, quelloffene Drucksystem"
)