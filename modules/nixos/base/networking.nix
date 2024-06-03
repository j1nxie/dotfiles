{ config, lib, pkgs, ... }:

{
  services = {
    syncthing.enable = true;
    deluge.enable = true;
  };

  environment.systemPackages = [ pkgs.cloudflared ];
}
