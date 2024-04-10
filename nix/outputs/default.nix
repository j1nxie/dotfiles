{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};
  myvars = import ../vars {inherit lib;};

  genSpecialArgs = system:
    inputs
    // {
      inherit mylib myvars;
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };

  args = {inherit inputs lib mylib myvars genSpecialArgs;};

  nixosSystems = {
    x86_64-linux = import ./x86-64-linux (args // {system = "x86_64-linux";});
  };

  allSystems = nixosSystems;
  allSystemNames = builtins.attrNames allSystems;
  nixosSystemValues = builtins.attrValues nixosSystems;
  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  debugAttrs = {inherit nixosSystems allSystems allSystemNames;};
  evalTests = lib.lists.all (it: it.evalTests == {}) nixosSystemValues;
  nixosConfigurations = lib.attrsets.mergeAttrsList (map (it: it.nixosConfigurations or {}) nixosSystemValues);

  packages = forAllSystems (
    system: allSystems.${system}.packages or {}
  );

  devShells = forAllSystems (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          fish
          gcc
        ];
        name = "dotfiles";
      };
    }
  );

  formatter = forAllSystems (
    system: nixpkgs.legacyPackages.${system}.alejandra
  );
}
