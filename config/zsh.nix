{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
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
