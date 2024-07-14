{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop

    remmina
    freerdp

    transmission_4-gtk
    trackma-gtk

    anydesk
  ];

  programs.gh.enable = true;
}
