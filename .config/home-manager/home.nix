{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "lumi";
  home.homeDirectory = "/home/lumi";

  home.stateVersion = "23.11";

  home.file = {
    "${config.home.homeDirectory}/.gitignore_global" = {
      source = ../../.gitignore_global;
    };
  };

  programs.kitty = {
    enable = true;
    # FIXME: ligature breaks in fish?
    font = {
      name = "Fira Code";
      size = 11;
    };
    extraConfig = "include current-theme.conf";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.vscode
    pkgs.neofetch
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
