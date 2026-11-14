{ ... }: {
  boot = {
    loader = {
      systemd-boot = {
        enable = false;
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
    kernel = {
      sysctl = {
        "fs.inotify.max_user_watches" = "524288"; # Default is often 8192
        "fs.file-max" = "524288"; # Also good to increase overall open files
      };
    };
  };
}
