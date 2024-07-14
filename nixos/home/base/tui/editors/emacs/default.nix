# ==============================================
# Based on doomemacs's auther's config:
#   https://github.com/hlissner/dotfiles/blob/master/modules/editors/emacs.nix
#
# Emacs Tutorials:
#  1. Official: <https://www.gnu.org/software/emacs/tour/index.html>
#  2. Doom Emacs: <https://github.com/doomemacs/doomemacs/blob/master/docs/index.org>
#
{
  config,
  lib,
  pkgs,
  doomemacs,
  ...
}:
with lib; let
  myEmacsPackagesFor = emacs: ((pkgs.emacsPackagesFor emacs).emacsWithPackages (epkgs: [
    epkgs.vterm
  ]));
  emacsPkg = myEmacsPackagesFor pkgs.emacs29-pgtk;
in {
  home.packages = with pkgs; [
    ## Doom dependencies
    emacsPkg
    git
    (ripgrep.override {withPCRE2 = true;})
    gnutls # for TLS connectivity

    ## Optional dependencies
    fd # faster projectile indexing
    imagemagick # for image-dired
    fd # faster projectile indexing
    zstd # for undo-fu-session/undo-tree compression

    # go-mode
    # gocode # project archived, use gopls instead

    ## Module dependencies
    # :checkers spell
    (aspellWithDicts (ds: with ds; [en en-computers en-science]))
    # :tools editorconfig
    editorconfig-core-c # per-project style config
    # :tools lookup & :lang org +roam
    sqlite
    # :lang latex & :lang org (latex previews)
    # texlive.combined.scheme-medium
    jansson
  ];

  xdg.configFile."doom" = {
    source = ./doom;
    force = true;
  };

  home.activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${doomemacs}/ ${config.xdg.configHome}/emacs/
  '';

  services.emacs = {
    enable = true;
    package = emacsPkg;
    client = {
      enable = true;
      arguments = [" --create-frame"];
    };
    startWithUserSession = true;
  };
}
