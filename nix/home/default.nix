{pkgs, ...}: {
  imports = [
    ./desktop
    ./editors
    ./git
    ./shell
  ];

  home.username = "lumi";
  home.homeDirectory = "/home/lumi";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    pkgs.unstable.vscode
    neofetch
    jetbrains-toolbox
    nodejs.pkgs.pnpm
    nodejs_20
    dotnet-sdk_7
    trackma-gtk
    btop
    htop
    transmission_4-gtk
    remmina
    insomnia
    vesktop
    pkgs.unstable.spotify-player
  ];

  programs.home-manager.enable = true;
}
