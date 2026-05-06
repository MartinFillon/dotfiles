{ mapping, ... }:
let
  coreBinds = [
    "$mod, Q, exec, kitty"
    "$mod, C, killactive"
    "$mod, F, fullscreen, 1"
    "$mod, TAB, workspace, e+1"
    "$mod SHIFT, TAB, workspace, e-1"
    "$mod, SPACE, exec, wofi"
    "$mod, L, exec, hyprlock"
    "$mod, S, exec, hyprshot -m region"
    "$mod SHIFT, S, exec, hyprshot -m fullscreen"
    "$mod, M, exec, wlogout"
  ];

  fr_mapping = [
    "ampersand" # &
    "eacute" # é
    "quotedbl" # "
    "apostrophe" # '
    "parenleft" # (
    "minus" # -
    "egrave" # è
    "underscore" # _
    "ccedilla" # ç
    "agrave" # à
  ];

  workspace_binds = builtins.concatLists (
    builtins.genList (
      i:
      let
        ws = i + 1;
        key = if (mapping == "fr") then builtins.elemAt fr_mapping i else toString i;
      in
      [
        "$mod, ${key}, workspace, ${toString ws}"
        "$mod SHIFT, ${key}, movetoworkspace, ${toString ws}"
        "$mod ALT, ${key}, movetoworkspacesilent, ${toString ws}"
      ]
    ) 10
  );
in

coreBinds ++ workspace_binds
