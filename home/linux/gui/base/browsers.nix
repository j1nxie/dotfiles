{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = ["--gtk-version=4"];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
  };
}
