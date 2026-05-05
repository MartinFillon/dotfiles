{ pkgs, ... }:

{
  imports = [
    # This assumes you have a hardware-configuration.nix.
    # If testing on Arch, you can comment this out for 'build' but
    # 'build-vm' might need it.
    ./hardware-configuration.nix
  ];

  # Enable Flakes and the 'nix' command
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  virtualisation.vmVariant = {
    virtualisation.memorySize = 4096;
    virtualisation.cores = 2;
  };

  # Basic System Setup
  networking.hostName = "laptop";
  time.timeZone = "Europe/Paris";
  services.xserver = {
    xkb.layout = "fr";
  };
  console.useXkbConfig = true;

  # Define your user account
  users.users."fexkoser" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
    hashedPassword = "$6$kT9luU0vpzTqg/Lj$cJhmeo1dqYxSeKbHWnIHPYqwHhBN7GtGZkg3ml8EaPw5pQD4ua1ejRal32oA8wJO7/nKp1FT/LTiPKfHiWTBQ1";
  };

  services.getty = {
    autologinUser = "fexkoser";
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    curl
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal-hyprland"
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    package = pkgs.hyprland;
  };

  programs.zsh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "25.11";
}
