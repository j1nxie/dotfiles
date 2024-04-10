{
  virtualisation = {
    virtualbox = {
      host.enable = true;
      guest.enable = true;
    };
    docker = {
      enable = true;
      daemon.settings = {
        "features" = {"containerd-snapshotter" = true;};
      };
      enableOnBoot = true;
    };
  };
}
