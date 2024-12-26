# ArchInstallHelper
Hilfe um alle Pakete die standartmäsig benutzt werden zu installieren nach der Installation von Arch


## Schritt 0
```
sudo pacman -S unzip
```

## Schritt 1
```
mkdir Downloads && cd Downloads && curl -L -o repo.zip https://github.com/PascalLehmann/ArchInstallHelper/archive/refs/heads/main.zip
```

## Schritt 2
```
unzip repo.zip && cd repo-main && chmod +x install.sh && ./install.sh
```