{
  pkgs,
  nixos-hardware,
  ...
}: let
  hostName = "adachi"; # Define your hostname.
in {
  imports = [
    nixos-hardware.nixosModules.framework-12th-gen-intel
    ./hardware-configuration.nix
    ./secureboot.nix
  ];

  boot = {
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = ["ntfs"];
  };

  networking = {
    inherit hostName;
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [57621];
      allowedUDPPorts = [5353];
    };
  };

  services.syncthing = {
    user = "lumi";
    dataDir = "/home/lumi";
  };

  hardware.acpilight.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  system.stateVersion = "23.11";
}
