#!/bin/bash
if [[ $2 == true ]]; then
    $1 -S sddm
    sudo git clone https://github.com/RadRussianRus/sddm-slice.git /usr/share/sddm/themes/sddm-slice
fi
sudo cp $DOTFILES/sddm/sddm.conf /etc/sddm.conf
