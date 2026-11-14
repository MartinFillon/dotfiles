{ vncServer, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraLuaFiles = {
      "main.lua" = {
        content = ''
          IS_VNC_SERVER = ${if vncServer then "true" else "false"}

          ${builtins.readFile ./hyprland/config.lua}
        '';
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
