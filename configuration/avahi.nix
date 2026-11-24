{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    settings.publish = {
      "disable-publishing" = false;
      "publish-addresses" = true;
      "publish-workstation" = true;
    };
  };
}
