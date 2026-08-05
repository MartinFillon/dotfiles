{ ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = "
    Host master.nanoforge.eu
      HostName 92.222.226.198
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/nanoforge-vms
    Host worker1.nanoforge.eu
      HostName 141.94.169.79
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/nanoforge-vms
    Host worker2.nanoforge.eu
      HostName 54.38.14.251
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/nanoforge-vms
    Host worker3.nanoforge.eu
      HostName 79.137.61.212
      PreferredAuthentications publickey
      IdentityFile ~/.ssh/nanoforge-vms
    ";
  };
}
