" File for organizing plugins
" Vim-plug {{{
filetype off
call plug#begin("~/.vim/plugged")
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
call plug#end()
filetype plugin indent on
" }}}
" Config {{{
let g:sneak#label = 1
let g:sneak#streak = 1
nnoremap s <Plug>SneakLabel_s
nnoremap S <Plug>SneakLabel_s
" }}}
" vim: foldmethod=marker
