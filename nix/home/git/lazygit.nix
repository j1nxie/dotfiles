{pkgs, ...}: {
  programs.lazygit = {
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
}
