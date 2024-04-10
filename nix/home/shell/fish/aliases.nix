{pkgs, ...}: {
  programs.fish.shellAliases = {
    # exa
    ls = "${pkgs.eza}/bin/exa";
    la = "${pkgs.eza}/bin/exa -lAh";
    ll = "${pkgs.eza}/bin/exa -lh";
    l = "${pkgs.eza}/bin/exa -lah";
    lsa = "${pkgs.eza}/bin/exa -lah";

    # lazygit
    lg = "${pkgs.unstable.lazygit}/bin/lazygit";
    ly = "${pkgs.unstable.lazygit}/bin/lazygit ~/dotfiles";
    # ly = "${pkgs.unstable.lazygit}/bin/lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git";

    # cat
    cat = "${pkgs.bat}/bin/bat --style=\"numbers,changes,header\" --theme=\$(if [ (gsettings get org.gnome.desktop.interface color-scheme) = \"'default'\" ]; echo \"catppuccinLatte\"; else; echo \"catppuccinMacchiato\"; end;)";
  };
}
