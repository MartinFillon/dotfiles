{
  pkgs,
  ...
}:

{
  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/helix.nix
    ./config/hyprland.nix
    ./config/kitty.nix
    ./config/wofi.nix
  ];

  home.username = "fexkoser";
  home.homeDirectory = "/home/fexkoser";

  home.packages = with pkgs; [
    htop
    nixfmt
    eza
    hyprshot
    waybar
  ];

  programs.home-manager = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
