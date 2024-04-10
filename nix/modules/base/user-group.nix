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
    adbusers = {};
    uinput = {};
  };

  users.users."${myvars.username}" = {
    home = "home/${myvars.username}";
    isNormalUser = true;
    extraGroups = [myvars.username "users" "networkmanager" "wheel" "docker" "tss" "vboxusers"];
    shell = pkgs.fish;
  };
}
