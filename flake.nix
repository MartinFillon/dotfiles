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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
          ./hosts/laptop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."fexkoser" = import ./home/home.nix;
          }
        ];
      };

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
