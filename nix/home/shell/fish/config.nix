{...}: {
  programs.fish.shellInit = ''
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
      todos
    end

    function todos
      set r (random 0 100)
      if [ $r -lt 5 ] # only occasionally show backlog (5%)
        echo -e " \e[1mbacklog:\e[0;32m"
        set_color blue
        # echo "  [project] <description>"
        echo
      end

      set_color normal
      echo -e " \e[1mtodos:\e[0;32m"
      echo
      if [ $r -lt 10 ]
        # unimportant, so show rarely
        set_color cyan
        # echo "  [project] <description>"
      end
      if [ $r -lt 25 ]
        # back-of-my-mind, so show occasionally
        set_color green
        # echo "  [project] <description>"
      end
      if [ $r -lt 50 ]
        # upcoming, so prompt regularly
        set_color yellow
        # echo "  [project] <description>"
      end

      # urgent, so prompt always
      set_color red
      # echo "  [project] <description>"

      echo

      if test -s ~/todo
        set_color magenta
        cat todo | sed 's/^/  /'
        echo
      end

      set_color normal
    end
    direnv hook fish | source
  '';
}
