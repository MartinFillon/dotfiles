#!/bin/sh
if [[ $2 == true ]]; then
    $1 -S wlogout
fi
ln -f $DOTFILES/wlogout/config $CONFIG_DIR/wlogout/config
ln -f $DOTFILES/wlogout/style.css $CONFIG_DIR/wlogout/style.css
