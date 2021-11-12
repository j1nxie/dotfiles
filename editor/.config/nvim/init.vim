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
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'yamatsum/nvim-cursorline'

" Lightspeed
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'ibhagwan/fzf-lua'

" Language support
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': ':COQdeps'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'neovim/nvim-lspconfig'

Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Trees
Plug 'mbbill/undotree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Code minimap
Plug 'wfxr/minimap.vim'

" Discord
Plug 'andweeb/presence.nvim'

" YABS
Plug 'pianocomposer321/yabs.nvim'

call plug#end()
unlet pluginsPath

" ==========================
" GENERAL SETTINGS
" ==========================

let mapleader = "\<Space>"

filetype plugin indent on
syntax enable
language en_US

colorscheme nightfox
set termguicolors
set guifont=FiraCode\ NF:style=Retina:h12
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
set tabstop=8 softtabstop=0 expandtab smarttab

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
nnoremap <F5> :CHADopen<CR>

" ==========================
" LIGHTLINE
" ==========================

let g:lightline = {
      \ 'colorscheme': 'nightfox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand' : {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ }

" ==========================
" PLUGINS SETTINGS
" ==========================
" Required functions to enable vim-devicons with lightline
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:python_highlight_all = 1

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

let g:coq_settings = { "keymap.jump_to_mark": "<c-n>"}
let g:coq_settings = { "keymap.bigger_preview": "<c-b>"}

" ==========================
" LANGUAGE SERVERS
" ==========================
lua << EOF
local lsp = require "lspconfig"
local coq = require "coq"

lsp.rust_analyzer.setup (
    coq.lsp_ensure_capabilities()
)

lsp.clangd.setup (
    coq.lsp_ensure_capabilities()
)

lsp.racket_langserver.setup (
    coq.lsp_ensure_capabilities()
)

require("yabs"):setup {
    languages = {
        cpp = {
            default_task = "build_and_run",
            tasks = {
                build = {
                    command = "clang++ % -Wall -Wextra -O2",
                    output = "quickfix",
                    opts = {
                        open_on_run = "always"
                        }
                },
                run = {
                    command = "./a.out",
                    output = "consolation",
                },
                build_and_run = {
                    command = function()
                        require("yabs"):run_task("build", {on_exit = function()
                            require("yabs").languages.cpp:run_task("run")
                        end})
                    end,
                    type = "lua"
                }
            }
        }
    },
    tasks = {
        build = {
            command = "echo building project...",
            output = "consolation"
        },
        run = {
            command = "echo running project...",
            output = "echo"
        }
    },
    opts = {
        output_types = {
            quickfix = {
                open_on_run = "always"
            }
        }
    }
}
EOF
