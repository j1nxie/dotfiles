{
  description = "lumi's nix configuration!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.kotonya = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules = [
        ({
          configs,
          pkgs,
          ...
        }: {nixpkgs.overlays = [overlay-unstable];})
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
