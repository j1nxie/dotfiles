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

" Easymotion
Plug 'easymotion/vim-easymotion'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Language support
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': ':COQdeps'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'

Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Trees
Plug 'mbbill/undotree'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Note plugin
Plug 'vimwiki/vimwiki'

" Code minimap
Plug 'wfxr/minimap.vim'

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
set guifont=FiraCode\ Nerd\ Font:style=Retina:h12
set clipboard^=unnamed,unnamedplus

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
EOF
