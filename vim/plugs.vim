" File for organizing plugins
let text_files = ['markdown', 'text']
" Generic {{{
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
call vundle#end()
filetype plugin indent on
" }}}
" Text {{{
" }}}
" Code {{{
function CodePlugs()
    filetype off
    call vundle#begin()
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'tpope/vim-commentary'
    call vundle#end()
    filetype plugin indent on
endfunction
autocmd BufWritePre * if index(g:text_files, &ft) < 0 | call CodePlugs()
" }}}
" vim: set foldmethod=marker
