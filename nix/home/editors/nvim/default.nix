{pkgs, ...}: {
  imports = [
    ./config.nix
    # ./plugins.nix
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
  };
}
