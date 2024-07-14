{myvars, ...}: {
  home = {
    inherit (myvars) username;

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
