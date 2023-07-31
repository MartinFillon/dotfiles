#!/bin/sh
if [[ $2 == true ]]; then
    $1 -S wofi
fi
ln -f $DOTFILES/wofi/config $CONFIG_DIR/wofi/config
ln -f $DOTFILES/wofi/style.css $CONFIG_DIR/wofi/style.css
