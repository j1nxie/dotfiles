{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];

    shellAliases = {
      # exa
      ls = "${pkgs.eza}/bin/exa";
      la = "${pkgs.eza}/bin/exa -lAh";
      ll = "${pkgs.eza}/bin/exa -lh";
      l = "${pkgs.eza}/bin/exa -lah";
      lsa = "${pkgs.eza}/bin/exa -lah";

      # lazygit
      lg = "${pkgs-unstable.lazygit}/bin/lazygit";
      ly = "${pkgs-unstable.lazygit}/bin/lazygit ~/dotfiles";
      # ly = "${pkgs-unstable.lazygit}/bin/lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git";

      # cat
      cat = "${pkgs.bat}/bin/bat --style=\"numbers,changes,header\" --theme=\$(if [ (gsettings get org.gnome.desktop.interface color-scheme) = \"'default'\" ]; echo \"catppuccinLatte\"; else; echo \"catppuccinMacchiato\"; end;)";
    };

    shellInit = ''
      set -x EDITOR nvim
      set -x TERMINAL kitty
      set -x DIRENV_LOG_FORMAT ""
      set --global tide_left_prompt_items context $tide_left_prompt_items
      set --global tide_context_always_display true
      set --global fish_greeting

      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x MANROFFOPT "-c"

      function fish_greeting
        echo
        echo -e (uname -ro | awk '{print " \\\\e[1mos: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1muptime: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo -e (uname -n | awk '{print " \\\\e[1mhostname: \\\\e[0;32m"$0"\\\\e[0m"}')
        echo
      end

      direnv hook fish | source
    '';
  };
}
