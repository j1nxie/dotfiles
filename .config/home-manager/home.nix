{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
    ./git.nix
    ./mpv.nix
    ./nvim.nix
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

  programs.bat = {
    enable = true;
    themes = {
      catppuccinLatte = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "HEAD";
          hash = "sha256-POoW2sEM6jiymbb+W/9DKIjDM1Buu1HAmrNP0yC2JPg=";
        };
        file = "themes/Catppuccin Latte.tmTheme";
      };

      catppuccinMacchiato = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "HEAD";
          hash = "sha256-POoW2sEM6jiymbb+W/9DKIjDM1Buu1HAmrNP0yC2JPg=";
        };
        file = "themes/Catppuccin Macchiato.tmTheme";
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    vscode
    neofetch
    jetbrains-toolbox
    nodejs.pkgs.pnpm
    nodejs_20
    dotnet-sdk_7
    trackma-gtk
    htop
    glxinfo
    transmission_4-gtk
    weechat
    firefox-devedition-bin
    insomnia
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
