{ ... }:
let
  mapping = "fr";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "waybar"
      ];

      "$mod" = "SUPER";
      cursor = {
        enable_hyprcursor = false;
      };
      bind = import ./hyprland/binds.nix { mapping = mapping; };
      input = import ./hyprland/input.nix { mapping = mapping; };
      general = import ./hyprland/general.nix { };
      misc = {
        disable_hyprland_logo = true;
      };
      decoration = import ./hyprland/decoration.nix { };
      animations = import ./hyprland/animations.nix { };
      # monitor = ",auto,0x0,1";
    };
    extraConfig = ''
      dwindle {
        pseudotile = yes
        preserve_split = yes
      }
      ecosystem {
        no_donation_nag = true;
      }
    '';
  };
}
