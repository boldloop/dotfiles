" this is a file that executes when vim opens a md file
" it mostly does autocompletion, but some other nice stuff too

let g:pathogen_blacklist = ['YouCompleteMe', 'supertab', 'syntastic']

setlocal norelativenumber nonumber

noremap j gj
noremap k gk

" sets up wrapping
set wrap
set linebreak
set nolist

" this is the completion stuff
" see http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
" also http://vim.wikia.com/wiki/Dictionary_completions
 
setlocal dictionary+=/usr/share/dict/words
set complete+=k

set spell spelllang=en_us

function! Smart_TabComplete()
    let line = getline('.') " current line
    let substr = strpart(line, -1, col('.')+1) 
    " ^from the start of the current line to one character right of the cursor
    let substr = matchstr(substr, "[^ \t]*$") " word till cursor
    if (strlen(substr)==0) " nothing to match on empty string
        return "\<tab>"
    else
        return "\<C-N>"
    endif
endfunction

inoremap <tab> <C-R>=Smart_TabComplete()<CR>
