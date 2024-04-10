{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains-toolbox
    nodejs.pkgs.pnpm
    nodejs_20
    dotnet-sdk_7
    trackma-gtk
    htop
    transmission_4-gtk
    vesktop
    pkgs.unstable.spotify-player
  ];
}
