{
  pkgs,
  config,
  lib,
  myvars,
  ...
}: {
  imports = [
    ./base
    ./base.nix
    ./desktop
  ];

  services.xserver = {
    enable = false;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = [pkgs.xterm];
  };

  environment.systemPackages = with pkgs; [
    # gnome icon themes, settings and tweaks
    gnome.adwaita-icon-theme
    gnome.gnome-settings-daemon
    gnome.gnome-tweaks

    # gnome extensions
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.pop-shell
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-panel
    gnomeExtensions.advanced-alttab-window-switcher

    # cursors
    catppuccin-cursors.macchiatoRosewater

    xwaylandvideobridge
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    totem
    gnome-terminal
    pkgs.orca
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
