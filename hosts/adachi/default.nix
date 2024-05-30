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

  fileSystems."/mnt/stuff" = {
    device = "/dev/disk/by-uuid/01D9D8D7E461C040";
    fsType = "ntfs";
    options = ["uid=1000" "gid=1000" "rw" "user" "exec" "umask=000" "x-gvfs-show"];
  };

  fileSystems."/mnt/more-stuff" = {
    device = "/dev/disk/by-uuid/18E26960E26942DC";
    fsType = "ntfs";
    options = ["uid=1000" "gid=1000" "rw" "user" "exec" "umask=000" "x-gvfs-show"];
  };

  system.stateVersion = "23.11";
}
