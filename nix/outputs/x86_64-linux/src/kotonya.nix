{
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "kotonya";
  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      "nix/modules/nixos/desktop.nix"
      "nix/hosts/${name}"
    ];
    home-modules = map mylib.relativeToRoot [
      "nix/home"
    ];
  };
in {
  nixosConfigurations = {
    "${name}" = mylib.nixosSystem args;
  };
}
