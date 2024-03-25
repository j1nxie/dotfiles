{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # systemd-boot
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = ["amdgpu"];
  boot.extraModulePackages = [pkgs.linuxKernel.packages.linux_6_1.lenovo-legion-module];
  boot.supportedFilesystems = ["ntfs"];

  networking.hostName = "kotonya";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [57621];
  networking.firewall.allowedUDPPorts = [5353];

  # timezone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  hardware.pulseaudio.enable = false;

  # backlight
  hardware.acpilight.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluez;
  services.blueman.enable = true;

  programs.fish = {
    enable = true;
    useBabelfish = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  users.users.root.initialHashedPassword = "";

  users.users.lumi = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "tss"];
    shell = pkgs.fish;
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
  services.xserver.excludePackages = [pkgs.xterm];

  services.tailscale.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  environment.systemPackages = with pkgs; [
    babelfish
    clang
    llvmPackages_16.bintools
    rustup
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    (pkgs.google-chrome.override {
      commandLineArgs = [
        "--gtk-version=4"
      ];
    })
    git
    procps
    eza
    lenovo-legion
    lm_sensors
    wget
    pop-launcher
    wl-clipboard
    gnome.adwaita-icon-theme
    gnome.gnome-settings-daemon
    gnome.gnome-tweaks
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.pop-shell
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.appindicator
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-panel
    gnomeExtensions.hide-top-bar
    gnomeExtensions.undecorate-window-for-wayland
    gnomeExtensions.advanced-alttab-window-switcher
    libimobiledevice
    ifuse
    spotify
    catppuccin-cursors.macchiatoRosewater
    rio
    python311Packages.ds4drv
    lutris
    wineWowPackages.stable
    winetricks
    xwaylandvideobridge
    fuseiso
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  virtualisation.virtualbox = {
    host.enable = true;
    guest.enable = true;
    guest.x11 = true;
  };
  users.extraGroups.vboxusers.members = ["lumi"];

  fonts.packages = with pkgs; [
    noto-fonts
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
    wqy_zenhei
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    totem
    gnome-terminal
    pkgs.orca
  ];

  location.provider = "geoclue2";
  services.geoclue2.enable = true;

  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  # gnupg agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # openssh
  services.openssh.enable = true;

  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;
  security.tpm2.tctiEnvironment.enable = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-unikey
    ];
  };

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];

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
