{...}: {
  imports = [
    ./config.nix
    ./keybinds.nix
  ];
  programs.mpv.enable = true;
}
