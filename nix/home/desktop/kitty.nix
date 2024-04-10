{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "Fira Code";
      size = 11;
    };
    extraConfig = "include current-theme.conf";
  };
}
