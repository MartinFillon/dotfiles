{ hostName }: {
  networking = {
    networkmanager = {
      enable = true;
    };
    extraHosts = "92.222.226.198 terraformid-670";
    hostName = hostName;
    wireless = {
      enable = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 5900 ];
    };
  };
}
