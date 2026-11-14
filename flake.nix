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

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      hosts = [
        {
          name = "laptop";
          username = "fexkoser";
          stateVersion = "25.11";
          gpu = false;
        }
        {
          name = "desktop";
          stateVersion = "26.05";
          gpu = true;
          vncServer = true;
          username = "fexkoser";
        }
      ];
      mkOs = host: {
        name = host.name;
        value = lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            hostName = host.name;
            stateVersion = host.stateVersion;
            gpu = host.gpu;
          };
          modules = [
            { nixpkgs.pkgs = pkgs; }

            ./configuration.nix
            ./hosts/${host.name}.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${host.username} = import ./home/home.nix {
                inherit pkgs;
                username = host.username;
                vncServer = host.vncServer ? false;
              };
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
