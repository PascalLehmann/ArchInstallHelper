#!/bin/bash

# Menüoptionen
options=(
    "Deinstallieren"
    "Ist installiert"
    "Installieren wenn nicht installiert"
    "Info"
    "yay Install"
    "Check"
    )
 
 
 # Array für ausgewählte Optionen
ausgewaehlt=()

# Leere Liste für nicht installierte Pakete
nicht_installierte_pakete=()