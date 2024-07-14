{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      (noto-fonts.overrideAttrs (oldAttrs: {
        installPhase = ''
          local out_font=$out/share/fonts/noto
          for folder in $(ls -d fonts/*/); do
            install -m444 -Dt $out_font "$folder"unhinted/otf/*.otf
          done
        '';
      }))
      noto-fonts-cjk
      noto-fonts-emoji

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      (fira-code.overrideAttrs (oldAttrs: {
        installPhase = ''
          runHook preInstall
          install -Dm644 ttf/*.ttf -t $out/share/fonts/truetype
          runHook postInstall
        '';
      }))
      (nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
        ];
      })

      emacs-all-the-icons-fonts
    ];
  };

  # https://wiki.archlinux.org/title/KMSCON
  services.kmscon = {
    # Use kmscon as the virtual console instead of gettys.
    # kmscon is a kms/dri-based userspace virtual terminal implementation.
    # It supports a richer feature set than the standard linux console VT,
    # including full unicode support, and when the video card supports drm should be much faster.
    enable = true;
    fonts = [
      {
        name = "Source Code Pro";
        package = pkgs.source-code-pro;
      }
    ];
    extraOptions = "--term xterm-256color";
    extraConfig = "font-size=12";
    # Whether to use 3D hardware acceleration to render the console.
    hwRender = true;
  };
}
