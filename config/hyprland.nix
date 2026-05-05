{ ... }:
let
  mapping = "fr";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      bind = import ./hyprland/binds.nix { mapping = mapping; };
      input = import ./hyprland/input.nix { mapping = mapping; };
      general = import ./hyprland/general.nix { };
      misc = {
        disable_hyprland_logo = true;
      };
      decoration = import ./hyprland/decoration.nix { };
      animations = import ./hyprland/animations.nix { };

      monitor = ",1920x1080@60,0x0,1";
    };
  };
}
