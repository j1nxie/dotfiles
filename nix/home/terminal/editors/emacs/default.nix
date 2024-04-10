{
  config,
  lib,
  pkgs,
  doomemacs,
  ...
}:
with lib; let
  cfg = config.modules.editors.emacs;
  envExtra = ''
    fish_add_path "${config.xdg.configHome}/emacs/bin
  '';
  myEmacsPackagesFor = emacs: ((pkgs.emacsPackagesFor emacs).emacsWithPackages (epkgs: [epkgs.vterm]));
in {
  options.modules.editors.emacs = {
    enable = mkEnableOption "emacs editor";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      home.packages = with pkgs; [
        git
        (ripgrep.override {withPCRE2 = true;})
        gnutls

        fd
        imagemagick
        fd
        zstd

        editorconfig-core-c
        sqlite
      ];

      programs.fish.shellInit = programs.fish.shellInit ++ envExtra;

      xdg.configFile."doom" = {
        source = ./doom;
        force = true;
      };

      home.activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${doomemacs}/ ${config.xdg.configHome}/emacs/
      '';
    }
    {
      home.packages = [myEmacsPackagesFor pkgs.emacs29-pgtk];
      services.emacs = {
        enable = true;
        package = myEmacsPackagesFor pkgs.emacs29-pgtk;
        client = {
          enable = true;
          arguments = ["--create-frame"];
        };
        startWithUserSession = true;
      };
    }
  ]);
}
