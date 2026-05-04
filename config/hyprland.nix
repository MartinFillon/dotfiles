{ pkgs, pkgs-unstable, config, ... }:

{
    programs.kitty.enable = true;
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "SUPER";
            bind = [
                "$mod, Q, exec, kitty"
            ];
            input = {
                kb_layout = "fr";
                follow_mouse = 1;
                touchpad = {
                    natural_scroll = false;
                };
                sensitivity = 0;
            };
        }
    }
}
