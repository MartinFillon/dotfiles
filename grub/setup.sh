#! /bin/bash

if [ ! -f /boot/grub/themes/halo ]; then
    sudo mkdir /boot/grub/themes/halo
fi

sudo cp -r ./grub/halo/* /boot/grub/themes/halo
sudo sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' /etc/default/grub
sudo sed -i 's/^\(GRUB_TERMINAL\w*=.*\)/#\1/' /etc/default/grub
sudo sed -i '/^GRUB_THEME=/d' /etc/default/grub
echo "GRUB_THEME=/boot/grub/themes/halo/theme.txt" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
