{
  description = "lumi's nix configuration!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.kotonya = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./.config/nixos/configuration.nix
        nixos-hardware.nixosModules.lenovo-legion-15ach6
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lumi = import ./.config/home-manager/home.nix;
        }
      ];
    };
  };
}
