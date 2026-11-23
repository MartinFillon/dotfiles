{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    profiles.default = {
      mutableUserSettings = true;
      userSettings = {
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'JetBrains Mono Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "terminal.integrated.fontFamily" =
          "'JetBrainsMono Nerd Font', 'JetBrains Mono Nerd Font', monospace";
      };
    };
  };
}
