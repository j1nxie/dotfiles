# lumi's personal linux dotfiles

## about

my personal dotfiles, powered by arch linux, running on a vmware workstation
virtual machine on top of windows 10! (blasphemy, i know, but it's the only way
i could manage running linux for work while still being able to play games)

## desktop environment

![screenshot of main workspace](https://i.imgur.com/KkEBmoA.jpeg)

- [bspwm](https://github.com/baskerville/bspwm): tiling window manager that does
  what it needs to do.
- [sxhkd](https://github.com/baskerville/sxhkd): hotkey
  daemon for use with bspwm.
- [dunst](https://github.com/dunst-project/dunst): lightweight notification daemon.
- [picom](https://github.com/yshui/picom): desktop compositor for x11.
- [polybar](https://github.com/polybar/polybar): fast and easy-to-use status bar.
- [kitty](https://github.com/kovidgoyal/kitty): fast gpu-based terminal emulator.

## applications
- [git](https://git-scm.com): version control system, all of my stuff is hosted
  on github.
- [lazygit](https://github.com/jesseduffield/lazygit): very fast
  terminal-based git ui.
- [zsh](https://zsh.org): preferred shell for daily usage.
- [neovim](https://neovim.io): vim, the terminal text editor, but on crack.
- [neovide](https://github.com/neovide/neovide): fast as fuck neovim gui
  with smooth scrolling and cursor animations.

## zsh
i basically live inside the terminal, and i use [zsh](https://zsh.org) for it.

![zsh screenshot](https://i.imgur.com/cJvIplm.jpeg)

### plugin manager - zinit
[zinit](https://github.com/zdharma/zinit) is a flexible and speedy (!) zsh
plugin manager.

### plugins

- [zinit](https://github.com/zdharma/zinit): manages zsh plugins for me.
- [powerlevel10k](https://github.com/romkatv/powerlevel10k): very clean and
  pretty theme, with full powerline support.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):
- [fish](https://fishshell.com)-like autosuggestions, very fast and unobtrusive.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting):
- [fish](https://fishshell.org)-like syntax highlighting.
- colored-man-pages: add colors to man pages.
- git: adds git aliases to zsh.
- command-not-found: processes commands not found.

### theme - powerlevel10k

[powerlevel10k](https://github.com/romkatv/powerlevel10k) is basically one of
the best powerline themes out there, built on top of
[nerdfonts](https://github.com/ryanoasis/nerd-fonts).

## neovim

i wanted to have something terminal-based for clean and fast text
editing, and my choice is [neovim](https://neovim.io), on top of
[neovide](https://github.com/neovide/neovide) for an ui implementation.

![neovim screenshot](https://i.imgur.com/F6RCO3c.jpeg)

### plugin manager - dep

- [dep](https://github.com/chiyadev/dep) is a plugin manager written in lua,
  very speedy and neat!

### plugins

**plugin manager:**
- [dep](https://github.com/chiyadev/dep): manages vim plugins.

**ui enhancements:**
- [nightfox](https://github.com/EdenEast/nightfox.nvim): soft dark theme built
  with lua.
- [lualine](https://github.com/nvim-lualine/lualine.nvim): statusline plugin
  built in lua.

**trees:**
- [undotree](https://github.com/mbbill/undotree): visualizer for undo history.
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree): fast and useful file
  explorer for neovim.

**git:**
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim): `vim-gitgutter` but
  better.

**language support:**
- [coq.nvim](https://github.com/ms-jpq/coq_nvim): very fast code completion
  plugin.
- [ale](https://github.com/dense-analysis/ale): linter for vim.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): configuration for
- lsps in neovim.

**miscellaneous:**
- [minimap.vim](https://github.com/wfxr/minimap.nvim): code minimap to help
- navigation.

## credits
- inspired by [pwyde's](https://github.com/pwyde/dotfiles) dotfiles. one day i
- stumbled upon by them and i was in love with how they're presented!
