{...}: {
  security = {
    polkit.enable = true;
    pam.services.greetd.enableGnomeKeyring = true;

    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };

  services.gnome.gnome-keyring.enable = true;

  # gpg agent with pinentry
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    settings.default-cache-ttl = 4 * 60 * 60; # 4 hours
  };
}
