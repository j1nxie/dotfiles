{
  pkgs,
  lib,
  lanzaboote,
  ...
}: {
  imports = [
    lanzaboote.nixosModules.lanzaboote
  ];

  environment.systemPackages = [
    pkgs.sbctl
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
