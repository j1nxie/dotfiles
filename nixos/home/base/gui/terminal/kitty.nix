{...}: {
  programs.kitty = {
    enable = true;
    # FIXME: ligature breaks in fish?
    font = {
      name = "Fira Code";
      size = 11;
    };
    extraConfig = "include current-theme.conf";
  };
}
