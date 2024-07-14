{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    imagemagick
    feishin
    jellyfin-mpv-shim
    spotify
  ];
}
