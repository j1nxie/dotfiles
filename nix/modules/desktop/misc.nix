{
  config,
  lib,
  pkgs,
}: {
  environment.shells = with pkgs; [
    fish
  ];
  users.defaultUserShell = pkgs.fish;

  security.sudo.keepTerminfo = true;
  environment.variables = {
    TZ = "${config.time.timeZone}";
  };

  services = {
    gvfs.enable = true;
  };

  programs = {
    ssh.startAgent = true;
    dconf.enable = true;
  };
}
