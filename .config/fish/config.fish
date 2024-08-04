set -x EDITOR nvim
set -x TERMINAL kitty
set -x DIRENV_LOG_FORMAT ""
set -x ANDROID_HOME ~/Android/Sdk
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

alias ls="exa"
alias la="exa -lAh"
alias ll="exa -lh"
alias l="exa -lah"
alias lsa="exa -lah"

alias lg="lazygit"
alias ly="lazygit -w ~ -g ~/.local/share/yadm/repo.git"

alias cat='bat --style="numbers,changes,header" --theme=$(if [ (gsettings get org.gnome.desktop.interface color-scheme) = "\'default\'" ]; echo "catppuccinLatte"; else; echo "catppuccinMacchiato"; end;)'

# pnpm
set -gx PNPM_HOME "/home/lumi/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rbenv
status --is-interactive; and rbenv init - fish | source
