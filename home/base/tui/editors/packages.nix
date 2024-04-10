{pkgs, ...}: {
  home.packages = with pkgs; [
    clang
    dotnet-sdk_7
    nodePackages.pnpm
    nodejs_20
    rustup
  ];
}
