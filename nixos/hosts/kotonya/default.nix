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
    extraModulePackages = [pkgs.linuxKernel.packages.linux_6_6.lenovo-legion-module];
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    lenovo-legion
  ];

  system.stateVersion = "23.11";
}
