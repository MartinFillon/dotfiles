{
  config,
  pkgs,
  ...
}:

{
  home.username = "fexkoser";
  home.homeDirectory = "/home/fexkoser";

  # User-specific packages (only available to this user)
  home.packages = with pkgs; [
    htop
  ];

  # Example: Managing a dotfile directly
  home.file.".config/test-file.txt".text = "Hello from Home Manager!";

  # Git configuration via Home Manager
  programs.git = {
    enable = true;
    userName = "MartinFILLON";
    userEmail = "martin.fillon@epitech.eu";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
