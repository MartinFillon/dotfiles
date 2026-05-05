{
  pkgs ? import <nixpkgs> { },
}:

let
  configPath = ./configuration.nix;
in
pkgs.mkShell {
  name = "nixos-test-env";

  buildInputs = [
    pkgs.nixos-rebuild
    pkgs.nixos-install-tools
  ];

  shellHook = ''
    # Check if the config file actually exists before setting NIX_PATH
    if [ ! -f "${toString configPath}" ]; then
      echo "⚠️  Error: configuration.nix not found in this directory!"
    else
      export NIX_PATH="nixpkgs=${pkgs.path}:nixos-config=${toString configPath}"
      echo "✅ NixOS environment ready."
      echo "Try running: nixos-rebuild build"
    fi
  '';
}
