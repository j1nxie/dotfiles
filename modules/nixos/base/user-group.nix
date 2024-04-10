{
  pkgs,
  myvars,
  config,
  ...
}: {
  users.groups = {
    "${myvars.username}" = {};
    docker = {};
    wireshark = {};
    # for android platform tools's udev rules
    adbusers = {};
    # misc
    uinput = {};
    vboxusers = {};
  };

  users.users."${myvars.username}" = {
    home = "/home/${myvars.username}";
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "networkmanager"
      "wheel"
      "docker"
      "wireshark"
      "adbusers"
      "vboxusers"
    ];
    shell = pkgs.fish;
  };

  users.users.root = {
    initialHashedPassword = "";
  };
}
