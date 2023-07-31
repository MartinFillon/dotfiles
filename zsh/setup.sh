#!/bin/sh
if [[ $2 == true ]]; then
    $1 -S zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
ln -f $DOTFILES/zsh/.zshrc $HOME/.zshrc
