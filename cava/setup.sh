#! /bin/bash

if [ $2 == true ]; then
    $1 -S cava
fi
ln -f $DOTFILES/cava/config $CONFIG_DIR/cava/config
