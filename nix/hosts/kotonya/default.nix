# kotonya - windows/nixOS + r5-5600h + rtx 3050 laptop
{
  pkgs,
  nixos-hardware,
  ...
}: let
  hostName = "kotonya";
in {
  imports = [
    ./hardware-configuration.nix
    ./secureboot.nix
    nixos-hardware.nixosModules.lenovo-legion-15ach6
  ];

  networking = {inherit hostName;};

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  boot = {
    loader.efi.canTouchEfiVariables = true;
    initrd.kernelModules = ["amdgpu"];
    extraModulePackages = [pkgs.linuxKernel.packages.linux_6_1.lenovo-legion-module];
    supportedFilesystems = ["ntfs"];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services.xserver.videoDrivers = ["amdgpu" "nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  environment.systemPackages = with pkgs; [
    delta
    clang
    llvmPackages_16.bintools
    rustup
    git
    gitflow
    procps
    eza
    lenovo-legion
    wget
    pop-launcher
    wl-clipboard
    lutris
    wineWowPackages.stable
    winetricks
    fuseiso
    ffmpeg
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    python3
  ];

  programs.wireshark.enable = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-unikey
    ];
  };

  fileSystems."/mnt/stuff" = {
    device = "/dev/disk/by-uuid/01D9D8D7E461C040";
    fsType = "ntfs";
    options = ["uid=1000" "gid=1000" "rw" "user" "exec" "umask=000" "x-gvfs-show"];
  };

  fileSystems."/mnt/more-stuff" = {
    device = "/dev/disk/by-uuid/18E26960E26942DC";
    fsType = "ntfs";
    options = ["uid=1000" "gid=1000" "rw" "user" "exec" "umask=000" "x-gvfs-show"];
  };

  programs.gamemode.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    SDL
    SDL2
    SDL2_image
    SDL2_mixer
    SDL2_ttf
    SDL_image
    SDL_mixer
    SDL_ttf
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    bzip2
    cairo
    cups
    curlWithGnuTls
    dbus
    dbus-glib
    desktop-file-utils
    e2fsprogs
    expat
    flac
    fontconfig
    freeglut
    freetype
    fribidi
    fuse
    fuse3
    gdk-pixbuf
    glew110
    glib
    gmp
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer
    gtk2
    harfbuzz
    icu
    keyutils.lib
    libGL
    libGLU
    libappindicator-gtk2
    libcaca
    libcanberra
    libcap
    libclang.lib
    libdbusmenu
    libdrm
    libgcrypt
    libgpg-error
    libidn
    libjack2
    libjpeg
    libmikmod
    libogg
    libpng12
    libpulseaudio
    librsvg
    libsamplerate
    libthai
    libtheora
    libtiff
    libudev0-shim
    libusb1
    libuuid
    libvdpau
    libvorbis
    libvpx
    libxcrypt-legacy
    libxkbcommon
    libxml2
    mesa
    nspr
    nss
    openssl
    p11-kit
    pango
    pixman
    python3
    speex
    stdenv.cc.cc
    tbb
    udev
    vulkan-loader
    wayland
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libXScrnSaver
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXft
    xorg.libXi
    xorg.libXinerama
    xorg.libXmu
    xorg.libXrandr
    xorg.libXrender
    xorg.libXt
    xorg.libXtst
    xorg.libXxf86vm
    xorg.libpciaccess
    xorg.libxcb
    xorg.xcbutil
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
    xorg.xkeyboardconfig
    xz
    zlib
  ];

  system.stateVersion = "23.11";
}
