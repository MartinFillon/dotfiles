#!/bin/bash
if [[ $2 == true ]]; then
    $1 -S hyprland hyprpaper
fi

ln -f $DOTFILES/hypr/hyprland.conf $CONFIG_DIR/hypr/hyprland.conf
ln -f $DOTFILES/hypr/hyprpaper.conf $CONFIG_DIR/hypr/hyprpaper.conf
ln -f $DOTFILES/hypr/wallpaper.jpg $CONFIG_DIR/hypr/wallpaper.jpg
ln -f $DOTFILES/hypr/nstart.sh $CONFIG_DIR/hypr/nstart.sh
