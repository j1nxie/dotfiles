{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neofetch
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    htop

    psmisc # killall/pstree/prtstat/fuser/...
    pciutils # lspci
    usbutils # lsusb
    hdparm # for disk performance, command
    dmidecode # a tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
  ];

  programs.fish.enable = true;

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
