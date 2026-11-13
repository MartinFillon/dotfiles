{
  description = "Dotfiles";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hosts = [
        {
          name = "laptop";
          stateVersion = "25.11";
        }
      ];
      mkOs = host: {
        name = host.name;
        value = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            hostName = host.name;
            stateVersion = host.stateVersion;
          };
          modules = [
            ./configuration.nix
            ./hosts/${host.name}.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."fexkoser" = import ./home/home.nix;
            }
          ];
        };
      };
    in
    {
      nixosConfigurations = builtins.listToAttrs (map mkOs hosts);

      devShells.${system} = {
        default = pkgs.mkShell {
          name = "nixos-test-env";

          packages = with pkgs; [
            hyprland
            nixfmt
            nixd
          ];

          shellHook = ''
                echo "{
              \"workspace\": {
                \"library\": [
                  \"${pkgs.hyprland}/share/hypr/stubs\"
                ]
              }
            }" > .luarc.json 
          '';
        };
      };
    };
}
