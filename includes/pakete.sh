#!/bin/bash

declare -A pakete_pre=(
    ["base-devel"]="Grundlegende Werkzeuge zum Erstellen von Arch Linux-Paketen"
    ["git"]="Git ist eine freie Software zur verteilten Versionsverwaltung von Dateien."
    ["gum"]="Ein Werkzeug für glamouröse Shell-Skripte."
)

declare -A pakete=(
    ["fastfetch"]="Fastfetch ist ein Werkzeug, das Systeminformationen abruft und sie hübsch anzeigt"
    ["neovim"]="hyperextensibler Vim-basierter Texteditor"
    ["stow"]=""
    ["waybar"]=""
    ["swww"]=""
    ["networkmanager"]=""
    ["starship"]=""
    ["qt5-graphicaleffects"]=""
    ["qt5-quickcontrols2"]=""
    ["qt5-svg"]=""
    ["lazygit"]=""
)

declare -A pakete_yay=(
    ["waypaper"]=""
    ["google-chrome"]=""
    ["getnf"]=""
)

declare -A pakete_deinstall=(
    ["vim"]=""
)