{...}: {
  programs.mpv.config = {
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

    screenshot-format = "jpg";
    screenshot-jpeg-quality = 95;
    screenshot-webp-lossless = "yes";
    screenshot-high-bit-depth = "yes";
    screenshot-sw = "yes";
    screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
    screenshot-directory = "~/Pictures/Screenshots";
  };
}
