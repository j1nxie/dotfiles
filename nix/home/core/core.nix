{pkgs, ...}: {
  home.packages = with pkgs; [
    fzf
    fd
    (ripgrep.override {withPCRE2 = true;})
    pkgs.unstable.lazygit
    duf
  ];

  programs = {
    bat = {
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

    lazygit = {
      enable = true;
      package = pkgs.unstable.lazygit;
      settings = {
        gui = {
          nerdFontsVersion = 3;
        };
        git = {
          paging = {
            colorArg = "always";
            pager = "delta $(if [ $(gsettings get org.gnome.desktop.interface color-scheme) == \"'prefer-dark'\" ]; then echo \"--dark\"; else echo \"\"; fi) --paging=never";
          };
        };
      };
    };

    htop.enable = true;
  };
}
