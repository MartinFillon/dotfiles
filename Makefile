##
## Just a Makefile to reconfigure everything easily
##

STOW ?= stow

TARGET ?= $$HOME

all: _zsh _hyprland _kitty _wofi _wlogout _swaylock _BetterDiscord _cava _hayabusa _helix _htop _nix _nvim _waybar _yay _pulse 

_zsh:
	$(STOW) --target=$(TARGET) --restow zsh

_hyprland:
	$(STOW) --target=$(TARGET) --restow hyprland

_kitty:
	$(STOW) --target=$(TARGET) --restow kitty

_wofi:
	$(STOW) --target=$(TARGET) --restow wofi


_wlogout:
	$(STOW) --target=$(TARGET) --restow wlogout


_swaylock:
	$(STOW) --target=$(TARGET) --restow swaylock


_BetterDiscord:
	$(STOW) --target=$(TARGET) --restow BetterDiscord


_cava:
	$(STOW) --target=$(TARGET) --restow cava


_hayabusa:
	$(STOW) --target=$(TARGET) --restow hayabusa


_helix:
	$(STOW) --target=$(TARGET) --restow helix


_htop:
	$(STOW) --target=$(TARGET) --restow htop


_nix:
	$(STOW) --target=$(TARGET) --restow nix


_nvim:
	$(STOW) --target=$(TARGET) --restow nvim


_waybar:
	$(STOW) --target=$(TARGET) --restow waybar


_yay:
	$(STOW) --target=$(TARGET) --restow yay


_pulse:
	$(STOW) --target=$(TARGET) --restow pulse
