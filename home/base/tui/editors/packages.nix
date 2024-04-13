{pkgs, ...}: let dotnetPkgs = (
  with pkgs.dotnetCorePackages; combinePackages [
    sdk_7_0
    sdk_8_0
]
); in {
  home.packages = with pkgs; [
    clang
    dotnetPkgs
    nodePackages.pnpm
    nodejs_20
    omnisharp-roslyn
    rustup
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${dotnetPkgs}";
  };
}
