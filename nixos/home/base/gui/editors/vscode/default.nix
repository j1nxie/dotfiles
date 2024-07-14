{
  pkgs-unstable,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
  };

  home.file = {
    "${config.xdg.configHome}/nvim/vscode.lua" = {
      source = ./vscode.lua;
    };
  };
}
