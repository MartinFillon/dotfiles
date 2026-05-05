{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/helix.nix
  ];

  home.username = "fexkoser";
  home.homeDirectory = "/home/fexkoser";

  home.packages = with pkgs; [
    htop
    nixfmt
  ];

  programs.home-manager = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
