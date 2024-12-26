#!/bin/bash

# Menüoptionen
options=(
    "Deinstallieren von nicht genutzten Paketen"
    "Was ist bereits installiert"
    "Installieren wenn nicht installiert"
    "Info ueber die zu installirenden Pakete"
    )
 
 
 # Array für ausgewählte Optionen
ausgewaehlt=()

# Leere Liste für nicht installierte Pakete
nicht_installierte_pakete=()