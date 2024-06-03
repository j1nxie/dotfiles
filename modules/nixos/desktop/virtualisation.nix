{...}: {
  virtualisation = {
    virtualbox = {
      host.enable = true;
      guest.enable = true;
    };

    docker.enable = true;
  };
}
