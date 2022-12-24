# config

## General :
```
sudo dnf upgrade --no-gpg-check
sudo dnf upgrade
```

replace .bashrc

## emacs
install company mode => ```
M-x package-install RET company RET
(add-hook 'after-init-hook 'global-company-mode)
```

## Jetbrains suite
https://www.jetbrains.com/fr-fr/toolbox-app/
```
tar -xvf jetbrains-toolbox-1.27.1.13673.tar.gz && cd jetbrains-toolbox-1.27.1.13673/ && ./jetbrains-toolbox
```

## discord
```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update
sudo dnf install discord
```

## github
```
ssh-keygen
```

## gnome
```
sudo dnf -y group install "Basic Desktop"
sudo dnf -y groupinstall "GNOME Desktop Environment"
```

## utilities
```
sudo dnf install graphviz kcachegrind
sudo dnf install htop exa
```
