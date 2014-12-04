"enable utf-8
set fileencoding=japan
set fileencodings=iso-2022-jp,utf-8,euc-jp,ucs-2le,ucs-2,cp932 

set number
set title
set showmatch
syntax on
set tabstop=2
set smartindent
set laststatus=2

set nocompatible               " be iMproved
filetype off


if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#end()
endif


NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1




filetype plugin indent on     " required!
filetype indent on

syntax on
colorscheme molokai
