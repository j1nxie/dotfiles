{
  config,
  pkgs,
  ...
}: {
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      vo = "gpu-next";
      gpu-api = "vulkan";
      gpu-context = "waylandvk";

      hwdec = "auto";

      target-trc = "srgb";
      gamma-factor = 1.1;

      keep-open = "yes";
      save-position-on-quit = "yes";
      autofit = "50%";
      force-seekable = "yes";
      cursor-autohide = 100;
      osd-bar = "no";

      volume = 50;
      volume-max = 100;

      demuxer-mkv-subtitle-preroll = "yes";
      sub-fix-timing = "yes";
      sub-auto = "fuzzy";

      alang = "ja,jp,jpn,en,eng";
      slang = "ja,jp,jpn,en,eng";

      screenshot-format = "webp";
      screenshot-webp-lossless = "yes";
      screenshot-high-bit-depth = "yes";
      screenshot-sw = "yes";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
      screenshot-directory = "~/Screenshots";
    };

    bindings = {
      "CTRL+1" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode A (HQ)\"";
      "CTRL+2" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode B (HQ)\"";
      "CTRL+3" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode C (HQ)\"";
      "CTRL+4" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode A+A (HQ)\"";
      "CTRL+5" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_VL.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_Soft_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode B+B (HQ)\"";
      "CTRL+6" = "no-osd change-list glsl-shaders set \"~~/shaders/Anime4K_Clamp_Highlights.glsl:~~/shaders/Anime4K_Upscale_Denoise_CNN_x2_VL.glsl:~~/shaders/Anime4K_AutoDownscalePre_x2.glsl:~~/shaders/Anime4K_AutoDownscalePre_x4.glsl:~~/shaders/Anime4K_Restore_CNN_M.glsl:~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl\"; show-text \"Anime4K: Mode C+A (HQ)\"";

      "CTRL+0" = "no-osd change-list glsl-shaders clr \"\"; show-text \"GLSL shaders cleared\"";
    };
  };

  home.file = {
    "${config.xdg.configHome}/mpv/shaders" = {
      source = ../mpv/shaders;
      recursive = true;
    };
  };
}
