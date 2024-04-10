{pkgs, ...}: {
  home.packages = with pkgs; [
    insomnia
    wireshark
  ];
}
