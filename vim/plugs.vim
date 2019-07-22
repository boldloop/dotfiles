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
Plug 'kien/rainbow_parentheses.vim'
" ncm2 {{{
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-syntax'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim'
Plug 'gaalcaras/ncm-R'
Plug 'ncm2/ncm2-ultisnips'
" }}}

call plug#end()
filetype plugin indent on
" }}}
" Config {{{
" makes lightline work
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set noshowmode

" ale
let g:ale_linters = {
\    'python': ['flake8']
\}

" Ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" YCM
let g:ycm_server_python_interpreter = systemlist("which python2.7")[0]
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 1

" sneak
let g:sneak#label = 1
let g:sneak#streak = 1
nnoremap s <Plug>SneakLabel_s
nnoremap S <Plug>SneakLabel_s
" }}}
" vim: foldmethod=marker
