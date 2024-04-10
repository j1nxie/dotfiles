{...}: {
  imports = [
    ./aliases.nix
    ./config.nix
    ./plugins.nix
  ];
  programs.fish.enable = true;
  programs.fzf.enable = true;
}
