{
  pkgs,
  nix-gaming,
  ...
}: {
  home.packages = with pkgs; [
    nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    gamescope
    winetricks
  ];
}
