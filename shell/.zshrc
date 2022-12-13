if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/lumi/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

autoload -Uz compinit
compinit

export EDITOR=nvim
export VISUAL=nvim
bindkey -v

export PATH="$PATH:$HOME/.rvm/bin"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
	OMZP::colored-man-pages \
	OMZP::command-not-found \
	OMZP::git \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-syntax-highlighting

### End of Zinit's installer chunk
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q
setopt promptsubst
zinit light hohmannr/bubblified

alias chrome="google-chrome-stable"
alias l='exa -lah'
alias la='exa -lAh'
alias ll='exa -lh'
alias ls='exa'
alias lsa='exa -lah'
alias nnn='nnn -e'
alias lg='lazygit'
