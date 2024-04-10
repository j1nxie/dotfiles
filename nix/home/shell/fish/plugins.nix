{pkgs, ...}: {
  programs.fish.plugins = [
    {
      name = "tide";
      src = pkgs.fishPlugins.tide.src;
    }
    {
      name = "fzf-fish";
      src = pkgs.fishPlugins.fzf-fish.src;
    }
    {
      name = "forgit";
      src = pkgs.fishPlugins.forgit.src;
    }
    {
      name = "colored-man-pages";
      src = pkgs.fishPlugins.colored-man-pages.src;
    }
    {
      name = "autopair";
      src = pkgs.fishPlugins.autopair.src;
    }
  ];
}
