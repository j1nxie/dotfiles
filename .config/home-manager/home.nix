{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
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

  programs.kitty.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "j1nxie";
    userEmail = "rylieeeeexd@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        signingkey = "/home/lumi/.ssh/id_ed25519.pub";
      };
      core = {
        editor = "nvim";
        pager = "delta";
        autocrlf = "input";
        excludesfile = "/home/lumi/.gitignore_global";
      };
      pull = {
        rebase = true;
      };
      color = {
        ui = "auto";
      };
      credential = {
        helper = "store";
      };
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
      push = {
        autoSetupRemote = true;
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      delta = {
        navigate = true;
        light = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      "filter \"lfs\"" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };
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
