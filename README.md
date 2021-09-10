<!-- vim:ft=markdown 
-->

# My Linux configuration

These are my current Linux configuration files, running on Arch Linux on a VMware virtual machine on Windows 10.

## Terminal

- `kitty`
- Usually used in tandem with `tmux` if I'm working over `ssh`, else it is used
by itself.
- **Configuration:**
  - Color scheme: [Nightfox](https://github.com/EdenEast/nightfox.nvim) 
  - True color support
  - Font: Fira Code (latest version, patched with Nerd Fonts)
  - `tmux`:
    - Color scheme: [Nightfox](https://github.com/EdenEast/nightfox.nvim)
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

- `neomutt` + `msmtp`
- WIP! I have yet to finish `neomuttrc` and `msmtprc`!

## Editor

- `neovim`
- Plugins:
  - Color scheme: [`Nightfox`](https://github.com/EdenEast/nightfox.nvim)
  - Plugin manager: [`vim-plug`](https://github.com/junegunn/vim-plug)
  - Status line: [`lightline`](https://github.com/itchyny/lightline.vim)
  - Fuzzy finder: [`fzf`](https://github.com/junegunn/fzf)
  - Code completion: [`coq.nvim`](https://github.com/ms-jpq/coq.nvim)
  - Git plugins: [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter) +
  [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
  - [`undotree`](https://github.com/mbbill/undotree)
  - [`vimwiki`](https://github.com/vimwiki/vimwiki)
  - [`CHADtree`](https://github.com/ms-jpq/chadtree)
- Arrow keys are unbound (this is to remove my bad habit of using arrow keys in
vim)
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
