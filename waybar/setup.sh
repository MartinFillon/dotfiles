#!/bin/bash
if [[ $2 == true ]]; then
    $1 -S waybar-hyprland-cava
fi
ln -f $DOTFILES/waybar/config.jsonc $CONFIG_DIR/waybar/config.jsonc
ln -f $DOTFILES/waybar/style.css $CONFIG_DIR/waybar/style.css
