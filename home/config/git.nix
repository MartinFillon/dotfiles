{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "MartinFILLON";
        email = "martin.fillon@epitech.eu";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
    };
    lfs.enable = true;
  };
}
