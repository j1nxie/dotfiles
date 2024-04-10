{lib, ...}: {
  boot.loader.systemd-boot = {
    configurationLimit = lib.mkDefault 10;
    consoleMode = lib.mkDefault "max";
  };

  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };
}
