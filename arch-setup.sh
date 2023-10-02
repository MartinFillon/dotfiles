#!/bin/bash
apps=("hypr" "sddm" "swaylock" "waybar" "wofi" "zsh" "cava" "grub")

if [ -z "${CONFIG_DIR+x}" ]; then
    export CONFIG_DIR=$HOME/.config
    echo "export CONFIG_DIR=$HOME/.config" >> zsh/.zshrc
fi

if [ -z "${DOTFILES+x}" ]; then
    export DOTFILES=$PWD
    echo "export DOTFILES=$PWD" >> zsh/.zshrc
fi

if [[ $(id -u) == 0 ]]; then
    echo "Please don't run as root"
    exit 1
fi

install=true
message="Installing"

manager="yay"

if [[ $1 == "--help" || $1 == "-h" ]]; then
    echo "Usage: ./arch-setup.sh [OPTIONS]"
    echo "Options:"
    echo "  --no-aur: Don't install using AUR package manager"
    echo "  -S [APP]: Install [APP]"
    echo "  --no-install: Don't install any packages"
    echo "  --re-link: re-link files"
    exit 0
fi

for (( arg=1; arg<=$#; arg++)); do
    if [[ $arg == "--no-aur" ]]; then
        manager="sudo pacman"
    fi
    if [[ $arg == "-S" ]]; then
        next=$((arg+1))
        if [ $next -gt $# ]; then
            echo "No package specified after -S"
            exit 1
        fi
        for app in "${apps[@]}"; do
            if [[ $app == $next ]]; then
                echo "Installing $app"
                $DOTEFILES/"$app"/setup.sh "$manager" "$install"
                exit 0
            fi
        done
    fi
    if [[ $arg == "--no-install" || "--re-link" ]]; then
        install=false
        message="Linking"
    fi
done

if [ $install == true ]; then
    sudo pacman -Sy
    sudo pacman -S yay
    yay -Sy
fi

for app in "${apps[@]}"; do
    echo "$message $app"
    ./"$app"/setup.sh "$manager" "$install"
done

if [ $install == false ]; then
    exit 0
fi
for line in $(cat packages.txt); then
    echo "Installing $line"
    manager -S "$line"
done
ssh-keygen
