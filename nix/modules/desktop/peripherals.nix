{pkgs, ...}: {
  # audio
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber = true;
  };
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    # iOS devices
    libimobiledevice
    ifuse

    fuseiso
  ];
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  # tablets
  hardware.opentabletdriver.enable = true;

  # misc
  hardware.acpilight.enable = true;
  services = {
    printing.enable = true;
    geoclue2.enable = true;
  };
}
