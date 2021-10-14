<!-- vim:ft=markdown 
-->

# lumi's personal linux dotfiles

## about

my personal dotfiles, powered by arch linux, running on a vmware workstation virtual machine on top of windows 10!
(blasphemy, i know, but it's the only way i could manage running linux for work while still being able to play games)

## desktop environment

![screenshot of main workspace](https://i.imgur.com/KkEBmoA.jpeg)

- [bspwm](https://github.com/baskerville/bspwm): tiling window manager that does what it needs to do.
- [sxhkd](https://github.com/baskerville/sxhkd): hotkey daemon for use with bspwm.
- [dunst](https://github.com/dunst-project/dunst): lightweight notification daemon.
- [picom](https://github.com/yshui/picom): desktop compositor for x11.
- [polybar](https://github.com/polybar/polybar): fast and easy-to-use status bar. 
- [kitty](https://github.com/kovidgoyal/kitty): fast gpu-based terminal emulator.

## applications
- [git](https://git-scm.com): version control system, all of my stuff is hosted on github.
- [lazygit](https://github.com/jesseduffield/lazygit): very fast terminal-based git ui.
- [zsh](https://zsh.org): preferred shell for daily usage.
- [neovim](https://neovim.io): vim, the terminal text editor, but on crack.
- [neovide](https://github.com/neovide/neovide): fast as fuck neovim gui with smooth scrolling and cursor animations.
- [nnn](https://github.com/jarun/nnn): terminal file manager
- [fzf](https://github.com/junegunn/fzf): command-line fuzzy finder

## zsh
i basically live inside the terminal, and i use [zsh](https://zsh.org) for it.

![zsh screenshot](https://i.imgur.com/cJvlplm.jpeg)

### plugin manager - zinit
[zinit](https://github.com/zdharma/zinit) is a flexible and speedy (!) zsh plugin manager.

### plugins
- [zinit](https://github.com/zdharma/zinit): manages zsh plugins for me.
- [bubblified](https://github.com/hohmannr/bubblified): very clean and pretty theme, with full powerline support.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): [fish](https://fishshell.com)-like autosuggestions, very fast and unobtrusive.
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): [fish](https://fishshell.org)-like syntax highlighting.
- fzf: integrates [fzf](https://github.com/junegunn/fzf) into zsh.
- colored-man-pages: add colors to man pages.
- git: adds git aliases to zsh.
- command-not-found: processes commands not found.
- github: adds github specific aliases to zsh.

### theme - bubblified
[bubblified](https://github.com/hohmannr/bubblified) is a very clean theme, built on top of [nerdfonts](https://github.com/ryanoasis/nerd-fonts)
with a built-in git parser and a high level of customizability.

## neovim
i wanted to have something terminal-based for clean and fast text editing, and my choice is [neovim](https://neovim.io), on top of
[neovide](https://github.io/neovide/neovide) for an ui implementation.

![neovim screenshot](https://i.imgur.com/F6RCO3c.jpeg)

### plugin manager - vim-plug
[vim-plug](https://github.com/junegunn/vim-plug) is a minimalistic, simple and fast vim/neovim plugin manager.

### plugins
**plugin manager:**
- [vim-plug](https://github.com/junegunn/vim-plug): manages vim plugins.

**ui enhancements:**
- [nightfox](https://github.com/EdenEast/nightfox.nvim): soft dark theme built with lua.
- [vim-devicons](https://github.com/ryanoasis/vim-devicons): adds icons to vim plugins.
- [lightline](https://github.com/itchyny/lightline.vim): light and minimalistic statusline/tabline for vim.

**trees:**
- [chadtree](https://github.com/ms-jpq/chadtree): file system explorer, faster than nerdtree!
- [undotree](https://github.com/mbbill/undotree): visualizer for undo history.

**git:**
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter): adds `git diff` in "gutter".
- [vim-fugitive](https://github.com/junegunn/vim-fugitive): adds git support to neovim.

**language support:**
- [coq.nvim](https://github.com/ms-jpq/coq_nvim): very fast code completion plugin.
- [ale](https://github.com/dense-analysis/ale): linter for vim.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): configuration for lsps in neovim.
- [vim-cpp-modern](https://github.com/bfrg/vim-cpp-modern): c++ syntax highlighting.
- [tabular](https://github.com/godlygeek/tabular): helps with text aligning and filtering.
- [vim-markdown](https://github.com/plasticboy/vim-markdown): markdown syntax highlighting.

**note plugin:**
- [vimwiki](https://github.com/vimwiki/vimwiki): personalized wiki built for vim.

**others:**
- [vim-easymotion](https://github.com/easymotion/vim-easymotion): adds quick and easy motions to navigate inside vim.
- [fzf](https://github.com/junegunn/fzf): basic fzf support in vim.
- [fzf.vim](https://github.com/junegunn/fzf.vim): plugin to enhance fzf inside vim.
- [minimap.vim](https://github.com/wfxr/minimap.nvim): code minimap to help navigation.

## known issues
- the `symlink.sh` script inside the repo is very outdated! i'm thinking of migrating it to [yadm](https://github.com/TheLocehiliosan/yadm) for
cleaner management.
- a lot of the files, especially my zsh dotfile is very messy since i recently migrated to zinit and i haven't rewritten it!

## credits
- inspired by [pwyde's](https://github.com/pwyde/dotfiles) dotfiles. one day i stumbled upon by them and i was in love with how they're presented!
their dotfiles are also what made me know about yadm, and i'm planning to migrate to it soon.
