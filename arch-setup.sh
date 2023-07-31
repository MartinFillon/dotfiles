#!/bin/bash
apps=("hypr" "sddm" "swaylock" "waybar" "wofi")

sudo pacman -Sy
sudo pacman -S yay
ln -f .zshrc ~/.zshrc

for app in "${apps[@]}"; do
    echo "Installing $app"
    ./"$app"/setup.sh
donesudo pacman -Sy
sudo pacman -S yay
ln -f .zshrc ~/.zshrc

for line in $(cat packages.txt); do
    echo "Installing $line"
    yay -S "$line"
done
