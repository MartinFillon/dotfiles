{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "nixos-test-env";

  buildInputs = [
    pkgs.hyprland
    pkgs.nixfmt
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
}
