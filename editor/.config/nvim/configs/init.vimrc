" ==========================
" PLUGINS
" ==========================
" Load dein (defaults to ~/.cache/dein/)
" Remember to:
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein

if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    
" Load plugins
" UI enhancements
    call dein#add('itchyny/lightline.vim')
    call dein#add('overcache/NeoSolarized')
    call dein#add('taohexxx/lightline-solarized')
    call dein#add('j1nxie/togglebg')
    call dein#add('ryanoasis/vim-devicons')

" Fuzzy finder
    call dein#add('junegunn/fzf') 
    call dein#add('junegunn/fzf.vim')

" Semantic language support
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
    
" Syntactic language support
    call dein#add('vim-jp/vim-cpp')
    call dein#add('octol/vim-cpp-enhanced-highlight')
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('vim-python/python-syntax')
    call dein#add('Vimjas/vim-python-pep8-indent')
    call dein#add('aliev/vim-compiler-python')

" Discord RPC integration
    call dein#add('ObserverOfTime/discord.nvim')

" Git plugins
    call dein#add('airblade/vim-gitgutter')
    call dein#add('tpope/vim-fugitive')

" Undotree
    call dein#add('mbbill/undotree')

" Note plugin
    call dein#add('vimwiki/vimwiki')

    call dein#end()
    call dein#save_state()
endif

" Install missing plugins on startup
if dein#check_install()
    call dein#install()
endif
