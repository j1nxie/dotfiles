<!-- vim:ft=markdown 
-->

# My Linux configuration

These are my Linux configuration files, currently used across all my Linux
environments:

- Arch Linux on dual-boot
- Arch Linux on Windows Subsystem for Linux
- Termux on Android

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
- Plugins:
  - Color scheme: [`NeoSolarized`](https://github.com/overcache/NeoSolarized)
  (fork of Solarized, has true color support)
  - Plugin manager: [`dein`](https://github.com/Shougo/dein.vim)
  - Status line: [`lightline`](https://github.com/itchyny/lightline.vim)
  - Fuzzy finder: [`fzf`](https://github.com/junegunn/fzf)
  - Code completion: [`coc.nvim`](https://github.com/neocline/coc.nvim)
  - Git plugins: [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter) +
  [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
  - [`undotree`](https://github.com/mbbill/undotree)
  - [`vimwiki`](https://github.com/vimwiki/vimwiki)
- Arrow keys are unbound (this is to remove my bad habit of using arrow keys in
vim)
- `F5` is bound to `togglebg#map`, which is used to switch between Solarized
Light and Dark if needed. This is taken from [`vim-colors-solarized`](https://github.com/altercation/vim-colors-solarized)'s
`autoload/togglebg.vim`.
- Various other keybinds are also described in my `init.vim`.

## Shell

- `zsh`
- Theme: [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)
- Plugin manager: [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh)
- Keybinds: vim-styled
- Plugins:
  - [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
  - [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
  - `git`
  - `colored-man-pages`
  - `command-not-found`
  - `fzf`
  - `github`
- I also alias every instance of `ls`-related commands to `exa`.
