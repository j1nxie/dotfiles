{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetchneovim

    pciutils
    usbutils
    dmidecode
  ];

  environment.variables.EDITOR = "nvim";
}
