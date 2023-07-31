#!/bin/bash
if [[ $2 == true ]]; then
    $1 -S swaylock
fi
ln -f $DOTFILES/swaylock/config $CONFIG_DIR/swaylock/config
