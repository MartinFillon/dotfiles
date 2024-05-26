##
## Just a Makefile to reconfigure everything easily
##

STOW ?= stow

TARGET ?= $$HOME

all: _zsh _hyprland _kitty _wofi _wlogout _swaylock _BetterDiscord _cava _hayabusa _helix _htop _nix _nvim _waybar _yay _pulse 

_zsh:
	$(STOW) $(OPTS) --target=$(TARGET) --restow zsh

_hyprland:
	$(STOW) $(OPTS) --target=$(TARGET) --restow hyprland

_kitty:
	$(STOW) $(OPTS) --target=$(TARGET) --restow kitty

_wofi:
	$(STOW) $(OPTS) --target=$(TARGET) --restow wofi


_wlogout:
	$(STOW) $(OPTS) --target=$(TARGET) --restow wlogout


_swaylock:
	$(STOW) $(OPTS) --target=$(TARGET) --restow swaylock


_BetterDiscord:
	$(STOW) $(OPTS) --target=$(TARGET) --restow BetterDiscord


_cava:
	$(STOW) $(OPTS) --target=$(TARGET) --restow cava


_hayabusa:
	$(STOW) $(OPTS) --target=$(TARGET) --restow hayabusa


_helix:
	$(STOW) $(OPTS) --target=$(TARGET) --restow helix


_htop:
	$(STOW) $(OPTS) --target=$(TARGET) --restow htop


_nix:
	$(STOW) $(OPTS) --target=$(TARGET) --restow nix


_nvim:
	$(STOW) $(OPTS) --target=$(TARGET) --restow nvim


_waybar:
	$(STOW) $(OPTS) --target=$(TARGET) --restow waybar


_yay:
	$(STOW) $(OPTS) --target=$(TARGET) --restow yay


_pulse:
	$(STOW) $(OPTS) --target=$(TARGET) --restow pulse
