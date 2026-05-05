{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix # This file is generated
    ./home.nix
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  users.users.fexkoser = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs.zsh.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtensions = "backup";
    extraSpecialArgs = { inherit pkgs pkgs-unstable; };
    user.fexkoser = { ... }: { };
  };

  nix.settings = {
    trusted-users = [
      "root"
      "fexkoser"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 134217728; # 128 MiB

    keep-outputs = true;
    keep-derivations = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # User-level systemd service for nix garbage collection
  systemd.user.services.nix-gc-user = {
    description = "Nix Garbage Collector (User)";
    script = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than 3d";
    serviceConfig = {
      Type = "oneshot";
      User = "fexkoser";
    };
  };

  environment.systemPackages = with pkgs; [
    git
    helix
  ];
}
