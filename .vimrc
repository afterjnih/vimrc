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

scriptencoding=utf-8
" 挿入モード時、ステータスラインの色を変更
" "
" " このファイルの内容をそのまま.vimrc等に追加するか、
" " pluginフォルダへこのファイルをコピーします。
" " 挿入モード時の色指定
if !exists('g:hi_insert')
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellowgui=none ctermfg=blue ctermbg=yellow cterm=none'
endif
if has('syntax')
augroup InsertHook
autocmd!
autocmd InsertEnter * call s:StatusLine('Enter')
autocmd InsertLeave * call s:StatusLine('Leave')
augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
if a:mode == 'Enter'
silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
silent exec g:hi_insert
else
highlight clear StatusLine
silent exec s:slhlcmd
endif
endfunction
function! s:GetHighlight(hi)
redir => hl
exec 'highlight '.a:hi
redir END
let hl = substitute(hl, '[\r\n]', '', 'g')
let hl = substitute(hl, 'xxx', '', '')
return hl
endfunction
