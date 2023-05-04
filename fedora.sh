#!/bin/bash

echo -e "\033[0;32mInstalling packages...\033[0m"

sudo dnf upgrade --no-gpg-check
sudo dnf upgrade
sudo dnf install htop exa
sudo dnf install graphviz kcachegrind
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update
sudo dnf install discord
sudo dnf install wget curl

echo -e "\033[0;32mPackages installed\033[0m"

echo -e "\033[0;32mGenenerating ssh-key...\033[0m"

ssh-keygen

echo -e "\033[0;32mssh-key generated\033[0m"

echo -e "\033[0;32mInstalling zsh...\033[0m"

sudo dnf install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -f .zshrc ~/.zshrc

ln -f .bashrc ~/.bashrc

chsh -s $(which zsh)

echo -e "\033[0;32mzsh installed\033[0m"

echo -e "\033[0;32mConfiguring vscode...\033[m"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install code

ln -f settings.json .config/Code/User/settings.json

echo -e "\033[0;32mvscode configured\033[m"

echo -e "\033[0;32mInstalling Criterion...\033[m"

chmod 777 ./epitechFiles/install_criterion.sh
sudo ./epitechFiles/install_criterion.sh

echo -e "\033[0;32mCriterion installed\033[m"
