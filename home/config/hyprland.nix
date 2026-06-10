{ ... }:
let
  mapping = "fr";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraLuaFiles = {
      "main.lua" = {
        content = ./hyprland/config.lua;
        autoLoad = true;
      };

      "binds.lua" = {
        content = ./hyprland/binds.lua;
        autoLoad = true;
      };

      "settings.lua" = {
        content = ./hyprland/settings.lua;
        autoLoad = true;
      };

      "window_rules.lua" = {
        content = ./hyprland/window_rules.lua;
        autoLoad = true;
      };
    };
  };
}
