{ pkgs, pkgs-unstable, ... }:

{
  users.users.fexkoser = {
    shell = pkgs.zsh;
  };

  home-manager.users.fexkoser = {
    imports = [
      ./config/hyprland.nix
    ];
  };
}
