{
  config,
  myvars,
  ...
}: let
  d = config.xdg.dataHome;
in rec {
  home.homeDirectory = "/home/${myvars.username}";

  home.sessionVariables = {
    WINEPREFIX = d + "/wine";

    BROWSER = "google-chrome-stable";

    DELTA_PAGER = "less -R";
  };
}
