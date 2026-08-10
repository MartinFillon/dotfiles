{ lib, ... }: {
  programs.ssh = {
    enable = true;

    settings =
      lib.recursiveUpdate
        {
          "*" = {
            ForwardAgent = false;
            AddKeysToAgent = "no";
            Compression = false;
            ServerAliveInterval = 0;
            ServerAliveCountMax = 3;
            HashKnownHosts = false;
            UserKnownHostsFile = "~/.ssh/known_hosts";
            ControlMaster = "no";
            ControlPath = "~/.ssh/master-%r@%n:%p";
            ControlPersist = "no";
          };
        }
        (
          lib.mapAttrs
            (name: value: {
              HostName = "${value}";
              PreferredAuthentications = "publickey";
              IdentityFile = "~/.ssh/nanoforge-vms";
            })
            {
              "master.nanoforge.eu" = "92.222.226.198";
              "worker1.nanoforge.eu" = "141.94.169.79";
              "worker2.nanoforge.eu" = "54.38.14.251";
              "worker3.nanoforge.eu" = "79.137.61.212";
            }
        );
  };
}
