{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "nixos-test-env";

  buildInputs = [
    pkgs.hyprland
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
