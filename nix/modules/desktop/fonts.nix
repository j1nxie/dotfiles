{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (pkgs.noto-fonts.overrideAttrs (oldAttrs: {
        installPhase = ''
          local out_font=$out/share/fonts/noto
          for folder in $(ls -d fonts/*/); do
            install -m444 -Dt $out_font "$folder"unhinted/otf/*.otf
          done
        '';
      }))
      noto-fonts-cjk
      noto-fonts-emoji
      (pkgs.fira-code.overrideAttrs (oldAttrs: {
        installPhase = ''
          runHook preInstall

          install -Dm644 ttf/*.ttf -t $out/share/fonts/truetype

          runHook postInstall
        '';
      }))
      fira-code-symbols
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];
  };

  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "Fira Code";
        package = pkgs.fira-code;
      }
    ];
    extraOptions = "--term xterm-256color";
    extraConfig = "font-size=12";
    hwRender = true;
  };
}
