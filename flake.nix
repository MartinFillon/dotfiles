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
          gpu = true;
          monitors = [
            {
              output = "HDMI-A-1";
              mode = "1920x1080@60";
              position = "0x0";
              scale = 1;
            }
            {
              output = "eDP-1";
              mode = "1920x1080@60";
              position = "1920x0";
              scale = 1;
            }
          ];
        }
        {
          name = "desktop";
          stateVersion = "26.05";
          gpu = true;
          vncServer = true;
          username = "fexkoser";
          monitors = [
            {
              output = "DP-1";
              mode = "1920x1080@60";
              position = "0x0";
              scale = 1;
            }
          ];
        }
      ];
      mkOs = import ./functions/mkOs.nix {
        inherit
          inputs
          lib
          pkgs
          home-manager
          ;
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
              },
              \"diagnostics.globals\": [
                \"MONITORS\",
                \"IS_VNC_SERVER\"
              ]
            }" > .luarc.json 
          '';
        };
      };
    };
}
