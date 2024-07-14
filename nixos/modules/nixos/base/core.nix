{lib, ...}: {
  boot.loader.systemd-boot = {
    configurationLimit = lib.mkDefault 10;
  };

  # for power management
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;

    tailscale.enable = true;
  };
}
