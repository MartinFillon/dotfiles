{
  pkgs,
  username,
  vncServer,
  ...
}@inputs:
let
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/helix.nix
    (import ./config/hyprland.nix inputs)
    ./config/kitty.nix
    ./config/wofi.nix
    ./config/waybar.nix
    ./config/hyprlock.nix
    ./config/wlogout.nix
    ./config/vscode.nix
    ./config/ssh.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  home.packages =
    with pkgs;
    [
      htop
      nixfmt
      eza
      floorp-bin
      bluetui
      jq
      nixd
      nixfmt
      discord
      adwaita-icon-theme
      gnome-themes-extra
      wireplumber
      dunst
      insomnia
      wl-clipboard
      (prismlauncher.override {
        jdks = [
          pkgs.jdk25
        ];
      })
      psmisc
    ]
    ++ (if vncServer then [ wayvnc ] else [ ]);

  programs.hyprshot = {
    enable = true;
    saveLocation = "${homeDirectory}/screenshots";
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

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

  programs.direnv = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.stateVersion = "26.05";
}
