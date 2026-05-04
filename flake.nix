{
    description = "Configuration";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        }
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
            };
            pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config = {
                    allowUnfree = true;
                };
            };
        in
        {
            homeConfigurations = {
                "desktop" = home-manager.lib.homeManagerConfiguration {
                    pkgs = pkgs;
                    modules = [
                        ./home.nix
                    ];
                };
            };
        };
}
