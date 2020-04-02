" Map F-9 to run python scripts from a shell inside the GVIM environment.
" Original command, used 'python', default version on your OS
" nnoremap <silent> <buffer> <F9> <Esc>:let @0=substitute(@%, ' ', '\\ ', 'g')<CR>:! python 0<CR>
" New command, asks user for version number. Whatever string user inputs is
" appended to 'python' in command line
nnoremap <silent> <buffer> <F9> <Esc>:let @0=substitute(@%, ' ', '\\ ', 'g')<CR>:exec ":! python".input("Version string [2.7]:")." 0"<CR>

let b:comment = '#'

" Map F-9 to display output of selected code in GVIM shell
" vnoremap <silent> <buffer> <F9> :w !python<CR>
" Get Version string for visual selection excecution too. Can't get
" reselection to work.
" vnoremap <silent> <buffer> <F9> <Esc>:exec "'<,'>w !python".input("Version string [2.7]:")<CR> | :gv 
vnoremap <silent> <buffer> <F9> <Esc>:exec "'<,'>w !python".input("Version string [2.7]:")<CR>
