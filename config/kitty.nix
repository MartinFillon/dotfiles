{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
      size = 15;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      background_opacity = 0.7;
      url_style = "dotted";
      mouse_hide_wait = 2.0;
    };
    themeFile = "Catppuccin-Mocha";
  };
}
