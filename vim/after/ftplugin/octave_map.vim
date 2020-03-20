" Map Alt+8 to find function declaration and definition, if it exists in the
" current file.
noremap <silent> <A-8> /^funct.*\<<C-r><C-w>\><CR>

let b:comment = '%'
let b:comment2 = '#'

" Map F-9 to run octave scripts from a shell inside the GVIM environment.
nnoremap <silent> <buffer> <F9> <Esc>:let @0=substitute(@%, ' ', '\\ ', 'g')<CR>:! octave 0<CR>

" Map F-5 to display output of selected code in GVIM shell
vnoremap <silent> <buffer> <F9> :w !octave<CR>
