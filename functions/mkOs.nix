{
  inputs,
  lib,
  pkgs,
  home-manager,
}:
host: {
  name = host.name;
  value = lib.nixosSystem {
    specialArgs = {
      inherit inputs;
      hostName = host.name;
      stateVersion = host.stateVersion;
      gpu = host.gpu;
      vncServer = host.vncServer or false;
    };
    modules = [
      { nixpkgs.pkgs = pkgs; }

      ../configuration.nix
      ../hosts/${host.name}.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${host.username} = import ../home/home.nix {
          inherit pkgs;
          username = host.username;
          vncServer = host.vncServer or false;
          monitors = host.monitors or [ ];
          lib = lib;
        };
      }
    ];
  };
}
