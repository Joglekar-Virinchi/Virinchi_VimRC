" Map F-9 to run python scripts from a shell inside the GVIM environment.
nnoremap <silent> <buffer> <F9> <Esc>:let @0=substitute(@%, ' ', '\\ ', 'g')<CR>:! python 0<CR>

let b:comment = '#'

" Map F-5 to display output of selected code in GVIM shell
vnoremap <silent> <buffer> <F9> :w !python<CR>
