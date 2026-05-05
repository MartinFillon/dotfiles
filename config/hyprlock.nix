{ pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;
    settings = {
      hide_cursor = true;
      ignore_empty_input = true;
    };
  };
}
