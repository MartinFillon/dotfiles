{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "nixos-test-env";

  buildInputs = [
    pkgs.nixos-rebuild
    pkgs.nixos-install-tools
    pkgs.mkpasswd
  ];

  shellHook = ''
    export NIX_SSL_CERT_FILE=/etc/ssl/cert.pem
  '';
}
