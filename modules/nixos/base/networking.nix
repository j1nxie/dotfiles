{ config, lib, pkgs, ... }:

{
  services.syncthing.enable = true;
  environment.systemPackages = [ pkgs.cloudflared ];
}
