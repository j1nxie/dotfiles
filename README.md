<!-- vim:ft=markdown 
-->

# My Linux configuration

These are my Linux configuration files, currently used across all my Linux
environments:

- Arch Linux on dual-boot
- Arch Linux on Windows Subsystem for Linux
- Termux on Android

## Overview

[- 1. Terminal](https://github.com/j1nxie/configs#terminal)
[- 2. Graphical user interface](https://github.com/j1nxie/configs#graphical-user-interface)
[- 3. Email client](https://github.com/j1nxie/configs#email-client)
[- 4. Editor](https://github.com/j1nxie/configs#editor)
[- 5. Shell](https://github.com/j1nxie/configs#shell)

## Terminal

- `kitty`
- Usually used in tandem with `tmux` if I'm working over `ssh`, else it is used
by itself.
- **Configuration:**
  - Color scheme: Solarized Dark
  - True color support
  - Font: Fira Code (latest version, patched with Nerd Fonts)
  - `tmux`:
    - Color scheme: Solarized Dark
    - Vim-like keybindings
    - True color support

## Graphical user interface

- `bspwm` + `polybar`
- **Configuration:**
  - `bspwm:`
    - Compositor: picom
    - Hotkeys daemon: sxhkd
    - Notifications: dunst
  - `polybar:`
    - Mainly taken from [jonhoo](https://github.com/jonhoo/)'s `polybar`
    [config](https://github.com/jonhoo/configs/).
    - Color scheme: Solarized Dark
    - Fonts:
      - Noto Sans Mono
      - Noto Sans CJK
      - Noto Sans Symbols 1/2

## Email client

- `mutt` + `msmtp`
- WIP! I have yet to finish `neomuttrc` and `msmtprc`!

## Editor

- `neovim`
- Configuration:
  - Color scheme: [`NeoSolarized`](https://github.com/overcache/NeoSolarized)
  (fork of Solarized Dark, has true color support)
  - Plugin manager: [`dein`](https://github.com/Shougo/dein.vim)
  - Status line: [`lightline`](https://github.com/itchyny/lightline.vim)
  - Fuzzy finder: [`fzf`](https://github.com/junegunn/fzf)
  - Code completion: [`coc.nvim`](https://github.com/neocline/coc.nvim)
  - Git plugins: [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter) +
  [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
  - [`undotree`](https://github.com/mbbill/undotree)
  - [`vimwiki`](https://github.com/vimwiki/vimwiki)
