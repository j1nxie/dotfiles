{pkgs, ...}: {
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pulseaudio
    libimobiledevice
    ifuse
    fuseiso
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;
  sound.enable = false;
  hardware.pulseaudio.enable = false;

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };
  services.blueman.enable = true;

  hardware.opentabletdriver.enable = true;

  services = {
    printing.enable = true;
    geoclue2.enable = true;

    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };

    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
      android-udev-rules
    ];
  };
}
