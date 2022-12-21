" ==========================
" PLUGINS
" ==========================
" Bootstrapping vim-plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent execute '!curl -fLo ' . autoload_plug_path . ' --create-dirs
	\ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

let pluginsPath = stdpath('data') . '/plugged'
call plug#begin(pluginsPath)

" UI enhancements
Plug 'nvim-lualine/lualine.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvchad/nvim-colorizer.lua'
Plug 'yamatsum/nvim-cursorline'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/which-key.nvim'

" Lightspeed
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'ibhagwan/fzf-lua'

" Language support
Plug 'dense-analysis/ale'
" Plug 'mfussenegger/nvim-lint'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': ':COQdeps', 'commit': '84ec5faf2aaf49819e626f64dd94f4e71cf575bc'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim', {'for': 'rust'}
Plug 'sevko/vim-nand2tetris-syntax', {'for': 'hdl'}
Plug 'tranvansang/octave.vim', {'for': 'octave'}
Plug 'saecki/crates.nvim'

Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'

" Git plugins
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Trees
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps', 'on': 'CHADopen', 'commit': '1995c603a579ac9f2c04696b3ca818a9953c5372'}
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x', 'on' : 'Neotree'}
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Code minimap
Plug 'wfxr/minimap.vim'

" Discord
Plug 'andweeb/presence.nvim'

call plug#end()
unlet pluginsPath

" ==========================
" GENERAL SETTINGS
" ==========================

let mapleader = "\<Space>"

filetype plugin indent on
syntax enable

colorscheme carbonfox 
set termguicolors
set guifont=FiraCode\ NF:style=Regular:h10
set clipboard^=unnamed,unnamedplus
set fileformats=unix,dos
set fileformat=unix

set number relativenumber

set splitright
set splitbelow

set hidden
set nobackup
set nowritebackup

set cmdheight=1
set noshowmode
set updatetime=300
set shortmess+=c
set signcolumn=yes
set scrolloff=2
set autoindent
set nowrap
set nojoinspaces
set showtabline=2

set shiftwidth=4
set tabstop=4 softtabstop=4

" ==========================
" KEYBINDS
" ==========================

" Keyboard shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

nnoremap j gj
nnoremap k gk

nnoremap <silent> <leader>gg :LazyGit<CR>

map H ^
map L $

noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -lb<cr><cr>

nnoremap <F6> :UndotreeToggle<CR>
nnoremap <F5> :Neotree<CR>

nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>

nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
nnoremap <silent> <leader>cd :lua require('crates').show_dependencies_popup()<cr>

nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>

nnoremap <silent> <leader>cH :lua require('crates').open_homepage()<cr>
nnoremap <silent> <leader>cR :lua require('crates').open_repository()<cr>
nnoremap <silent> <leader>cD :lua require('crates').open_documentation()<cr>
nnoremap <silent> <leader>cC :lua require('crates').open_crates_io()<cr>

" ==========================
" PLUGINS SETTINGS
" ==========================
if has("persistent_undo")
    set undodir=$HOME"/.undodir"
    set undofile
endif

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'chadtree', 'tagbar', 'undotree']
let g:minimap_close_buftypes = ['startify', 'netrw', 'vim-plug']
let g:minimap_highlight_range = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1

let g:coq_settings = { "keymap.jump_to_mark": "<c-n>", "keymap.bigger_preview": "<c-b>" }

let g:chadtree_settings = { "theme.text_colour_set": "nerdtree_syntax_dark" }

let g:presence_main_image = "file"

let g:ale_disable_lsp = 1
let g:ale_fixers = {
            \    'javascript': ['eslint'],
            \    'typescript': ['eslint'],
            \    'rust': ['rustfmt'],
            \    'cpp': ['clangtidy'],
            \    'c': ['clangtidy'],
            \ }
let g:ale_fix_on_save = 1

" ==========================
" LANGUAGE SERVERS
" ==========================
lua << EOF
    local lsp = require("lspconfig")
    local coq = require("coq")
    local rt = require("rust-tools")

    rt.setup({
        server = {
            coq.lsp_ensure_capabilities({
                settings = {
                    ["rust-analyzer"] = {
                        ["checkOnSave.command"] = "clippy"
                    }
                }
            })
        }
    })

    lsp.clangd.setup (
        coq.lsp_ensure_capabilities()
    )

    lsp.racket_langserver.setup (
        coq.lsp_ensure_capabilities()
    )

    lsp.eslint.setup(
        coq.lsp_ensure_capabilities()
    )

    require('lualine').setup()
    require('colorizer').setup()
    require('gitsigns').setup()
    require('crates').setup {
        src = {
            coq = {
                enabled = true,
                name = "crates.nvim",
            },
        }
    }
    require('which-key').setup()
EOF
