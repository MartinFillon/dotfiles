# Dotfiles

## Install

```sh
git clone https://github.com/MartinFillon/dotfiles.git
cd dotfiles
./arch-install
```

## Options

```sh
./arch-install --no-aur
```
Uses [pacman](https://wiki.archlinux.org/title/pacman) instead of [yay](https://github.com/Jguer/yay)

```sh
./arch-install -s [app]
```
Install only **one** app (hypr sddm waylock waybar wofi zsh cava)\
Note: to use **-s** with the other options you need to place it last

```sh
./arch-install --no-install
./arch-install --re-link
```
Only applies the hard links

