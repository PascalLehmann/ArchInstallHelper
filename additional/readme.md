(https://www.youtube.com/watch?v=S2QAKxybgMg&t=100s)

// preinstall
loadkeys de-latin1
pacman-key --init
pacman-key --populate archlinux

sudo pacman -S power-profiles-deamon


// for gaming
sudo pacman -S gamemode
sudo pacman -S lib32-gamemode
sudo usermod -aG gamemode $USER
// to test
gamemoded -t

// install firewall
sudo pacman -S ufw
sudo ufw enable
sudo systemctl enable ufw

// nvidia optimation
1. Navigate to /boot/loader/entries and edit the appropriate .conf file.
Put this at the end (This is all you need!):
options linux ... nvidia-drm.modeset=1 nvidia-drm.fbdev=1

2. Create a file called nvidia.hook - copy and paste this in
/etc/pacman.d/hooks/nvidia.hook:

[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
# You can remove package(s) that don't apply to your config, e.g. if you only use nvidia-open you can remove nvidia-lts as a Target
Target=nvidia
Target=nvidia-open  CHOOSE THE RIGHT ONE
Target=nvidia-lts
#  If running a different kernel, modify below to match
Target=linux

[Action]
Description=Updating NVIDIA module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux*) exit 0; esac; done; /usr/bin/mkinitcpio -P'
