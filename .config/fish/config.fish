if status is-interactive
    # Commands to run in interactive sessions can go here
end

set --global tide_left_prompt_items context $tide_left_prompt_items
set --global tide_context_always_display true
set --global fish_greeting

if command -v exa > /dev/null
	abbr -a l "exa -lah"
	abbr -a la "exa -lAh"
	abbr -a ll "exa -lh"
	abbr -a ls "exa"
	abbr -a lsa "exa -lah"
else
	abbr -a l "ls"
	abbr -a ll "ls -l"
	abbr -a lll "ls -la"
end

abbr -a lg "lazygit"
abbr -a ly "lazygit -ucd ~/.local/share/yadm/lazygit -w ~ -g ~/.local/share/yadm/repo.git"
abbr -a icat "kitten +icat"
abbr -a nvide "neovide"
abbr -a random "python3 ~/projects/scripts/random-org.py"

setenv EDITOR nvim

function fish_greeting
	echo
	echo -e (uname -ro | awk '{print " \\\\e[1mos: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1muptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mhostname: \\\\e[0;32m"$0"\\\\e[0m"}')

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
		cat todo | sed 's/^/ /'
		echo
	end

	set_color normal
end

if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec startx -- -keeptty
	end
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/home/lumi/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
