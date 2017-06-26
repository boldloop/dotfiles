" sets up pathogen
execute pathogen#infect()
" sets up syntax highlighting
syntax enable
" sets line numbers
set relativenumber
set number
" sets parenthetical highlighting to just bold
hi MatchParen cterm=bold ctermbg=none ctermfg=none
" sets tabs to 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" sets noexpandtab for Makefiles
if @% == 'Makefile'
    set noexpandtab
    set tabstop=4
endif
" enables plugins
filetype plugin on
" sets diff cursors for modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"  
" sets ctrl-h to toggle line numbers  
nnoremap <C-h> :set number! relativenumber! <CR>
