{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop

    remmina
    freerdp

    transmission_4-gtk
  ];

  programs.gh.enable = true;
}
