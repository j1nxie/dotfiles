{
  description = "lumi's nix configuration!";

  nixConfig = {
    extra-substituters = [
      "https://nix-gaming.cachix.org"
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # nixpkgs repository
    # stable for my current main machine - which crashes under unstable
    # unstable for various packages i want to have latest versions of
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # extra gaming / hardware repos
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager for user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # doomemacs repository, non-flake
    doomemacs = {
      url = "github:doomemacs/doomemacs";
      flake = false;
    };
  };

  outputs = inputs: import ./outputs inputs;

  /*
     outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    emacs-overlay,
    lanzaboote,
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
        }: {nixpkgs.overlays = [overlay-unstable (import emacs-overlay)];})
        lanzaboote.nixosModules.lanzaboote
        ./nix/hosts/kotonya
        nixos-hardware.nixosModules.lenovo-legion-15ach6
        home-manager.nixosModules.home-manager
        {
          nix.settings.trusted-users = ["lumi"];
        }
        {
          nixpkgs.config.allowUnfree = true;
        }
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lumi = import ./nix/home;
        }
      ];
    };
  };
  */
}
