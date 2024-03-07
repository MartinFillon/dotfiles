##
## Just a Makefile to reconfigure everything easily
##

STOW ?= stow

TARGET ?= $$HOME

all: zsh hyprland kitty

zsh:
	$(STOW) --target=$(TARGET) --restow zsh

hyprland:
	$(STOW) --target=$(TARGET) --restow hyprland

kitty:
	$(STOW) --target=$(TARGET) --restow kitty

fclean:
	$(STOW) --target=$(TARGET) --delete zsh 
	$(STOW) --target=$(TARGET) --delete hyprland 

.PHONY: hyprland zsh all kitty
