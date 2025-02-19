##
## Just a Makefile to reconfigure everything easily
##

STOW ?= stow

TARGET ?= $$HOME

all: _zsh _hyprland _kitty _wofi _wlogout _swaylock _helix _htop _nix _waybar _yay _pulse 

_zsh:
	$(STOW) $(OPTS) --target=$(TARGET) --restow zsh

_%:
	$(STOW) $(OPTS) --target=$(TARGET) --restow $*
