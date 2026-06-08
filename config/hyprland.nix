{ ... }:
let
  mapping = "fr";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraLuaFiles = {
      "main.lua" = ./hyprland/config.lua;
      autoLoad = true;
    };
    # settings = {
    #   exec-once = [
    #     "waybar"
    #   ];

    #   "$mod" = "SUPER";
    #   cursor = {
    #     enable_hyprcursor = false;
    #   };
    #   bind = import ./hyprland/binds.nix { mapping = mapping; };
    #   input = import ./hyprland/input.nix { mapping = mapping; };
    #   general = import ./hyprland/general.nix { };
    #   misc = {
    #     disable_hyprland_logo = true;
    #   };
    #   decoration = import ./hyprland/decoration.nix { };
    #   animations = import ./hyprland/animations.nix { };
    #   monitor = "eDP-1,1920x1080@60,0x0,1";
    # };
    # extraConfig = ''
    #   dwindle {
    #     pseudotile = yes
    #     preserve_split = yes
    #   }
    #   ecosystem {
    #     no_update_news = true;
    #   }
    # '';
  };
}
