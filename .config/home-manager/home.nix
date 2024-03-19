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
    "${config.xdg.configHome}/nvim/vscode.lua" = {
      source = ../nvim/vscode.lua;
    };
  };
  
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
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

  programs.gh.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vscode
    neofetch
    jetbrains-toolbox
    nodejs.pkgs.pnpm
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
