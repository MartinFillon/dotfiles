mkdir -p "$1"/.config

cp ~/.config/"$1" "$1"/.config/. -r

mv ~/.config/"$1" ~/.config/"$1".bak

echo -e "\n" >> Makefile
echo "_$1:" >> Makefile
echo -e "\t"'$(STOW) --target=$(TARGET) --restow '"$1" >> Makefile

make "_$1"
