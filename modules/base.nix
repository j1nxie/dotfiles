{
  pkgs,
  myvars,
  ...
} @ args: {
  environment.systemPackages = with pkgs; [
    git
    git-lfs

    gnugrep
    gnused
    gawk
    jq

    curl
    aria2

    file
    findutils
    which
    tree
    rsync
  ];

  users.users.${myvars.username} = {
    description = myvars.userfullname;
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [myvars.username];
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    builders-use-substitutes = true;
  };
}
