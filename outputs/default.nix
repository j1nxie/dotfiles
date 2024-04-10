{nixpkgs, ...} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};
  myvars = import ../vars {inherit lib;};

  # Add my custom lib, vars, nixpkgs instance, and all the inputs to specialArgs,
  # so that I can use them in all my nixos/home-manager/darwin modules.
  genSpecialArgs = system:
    inputs
    // {
      inherit mylib myvars;

      # use unstable branch for some packages to get the latest updates
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system; # refer the `system` parameter form outer scope recursively
        # To use chrome, we need to allow the installation of non-free software
        config.allowUnfree = true;
      };
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        # To use chrome, we need to allow the installation of non-free software
        config.allowUnfree = true;
      };
    };

  # This is the args for all the haumea modules in this folder.
  args = {inherit inputs lib mylib myvars genSpecialArgs;};

  # modules for each supported system
  nixosSystems = {
    x86_64-linux = import ./x86_64-linux (args // {system = "x86_64-linux";});
  };
  allSystems = nixosSystems;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;

  # Helper function to generate a set of attributes for each system
  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  # Add attribute sets into outputs, for debugging
  debugAttrs = {inherit nixosSystems allSystems allSystemNames;};

  # NixOS Hosts
  nixosConfigurations =
    lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or {}) nixosSystemValues);

  # Packages
  packages = forAllSystems (
    system: allSystems.${system}.packages or {}
  );

  # Development Shells
  devShells = forAllSystems (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          gcc
          alejandra
          deadnix
          statix
          typos
        ];
        name = "dotfiles";
      };
    }
  );

  # Format the nix code in this flake
  formatter = forAllSystems (
    # alejandra is a nix formatter with a beautiful output
    system: nixpkgs.legacyPackages.${system}.alejandra
  );
}
