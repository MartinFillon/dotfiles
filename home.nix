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
    ./config/waybar.nix
    ./config/hyprlock.nix
    ./config/wlogout.nix
  ];

  home.username = "fexkoser";
  home.homeDirectory = "/home/fexkoser";

  home.packages = with pkgs; [
    htop
    nixfmt
    eza
    hyprshot
    floorp-bin
    bluetui
    discord
    adwaita-icon-theme
    gnome-themes-extra
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  programs.home-manager = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
