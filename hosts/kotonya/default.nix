{
  pkgs,
  nixos-hardware,
  ...
}: let
  hostName = "kotonya"; # Define your hostname.
in {
  imports = [
    nixos-hardware.nixosModules.lenovo-legion-15ach6
    ./hardware-configuration.nix
    ./secureboot.nix
  ];

  boot = {
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = ["amdgpu"];
    extraModulePackages = [pkgs.linuxKernel.packages.linux_6_1.lenovo-legion-module];
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

  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    open = false;
    nvidiaSettings = true;
  };
  virtualisation.docker.enableNvidia = true; # for nvidia-docker

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    lenovo-legion
  ];

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
