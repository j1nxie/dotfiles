{pkgs, pkgs-unstable, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    imagemagick
    pkgs-unstable.feishin
  ];
}
