" Map F-9 to run python scripts from a shell inside the GVIM environment.
noremap <silent> <buffer> <F9> <Esc>:let @0=substitute(@%, ' ', '\\ ', 'g')<CR>:! pdflatex 0<CR>

let b:comment = '%'
