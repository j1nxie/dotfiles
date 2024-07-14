{pkgs, ...}: let dotnetPkgs = (
  with pkgs.dotnetCorePackages; combinePackages [
    sdk_7_0
    sdk_8_0
]
); in {
  home.packages = with pkgs; [
    clang
    clang-tools
    dotnetPkgs
    nodePackages.pnpm
    nodejs_20
    omnisharp-roslyn
    python3
    rustup
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${dotnetPkgs}";
  };
}
