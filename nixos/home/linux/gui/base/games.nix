{
  pkgs,
  nix-gaming,
  ...
}: {
  home.packages = with pkgs; [
    nix-gaming.packages.${pkgs.system}.osu-stable
    gamescope
    (retroarch.override {
      cores = with libretro; [
        mgba
      ];
    })
    parsec-bin
  ];
}
