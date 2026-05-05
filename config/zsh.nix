{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza --color=auto -la --icons";
      helix = "hx";
    };
    oh-my-zsh = {
      enable = true;
      theme = "murilasso";
      plugins = [
        "git"
      ];
    };
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
    };
  };
}
