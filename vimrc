" Map <F1> to open .vimrc in a new tab
noremap <silent> <F1> :tabe $MYVIMRC<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" general appearance
colo desert
set nu
set cursorline
hi cursorline guibg=NONE
hi CursorLineNr gui=bold guifg=grey70
hi LineNr guifg=grey50
set lines=40 columns=130
set foldmethod=indent
set foldnestmax=1
set foldminlines=5
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set nrformats-=octal
nnoremap <silent> <CR> :noh<CR>
filetype plugin indent on

" Octave syntax
 augroup filetypedetect
   au! BufRead,BufNewFile *.m,*.oct set filetype=octave
 augroup END

" Command mode call map
noremap ; :
noremap : ;

" Movement mappings
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> 0 g0
noremap <silent> $ g$
" noremap <silent> <Up> g<Up>
" noremap <silent> <Down> g<Down>
" noremap <silent> <Home> g<Home>
" noremap <silent> <End> g<End>

" Move visual text up and down with <C-Up> and <C-Down>
vnoremap <silent> <C-Down> :m'>+1<CR>gv
vnoremap <silent> <C-Up> :m'<-2<CR>gv

" Retain visual selection after indenting
vnoremap > >gv
vnoremap < <gv

" Closing bracket mappings
" inoremap ( ()<Left>
" inoremap [ []<Left>

" Path and working directory movement mappings
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
noremap <silent> <F10> <Esc>:NERDTreeToggle<CR> 

" Window movement mappings
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-l> <C-w>l
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k

" Tab movement mappings
noremap <silent> Û gT
noremap <silent> Ý gt

" Map <F7> and <F8> to comment/uncomment lines of code (Filetype specific
" variables b:comment and b:comment2 (optional) need to be declared)
function! Comment()
	if exists("b:comment")
		execute "silent! s/\\S/".b:comment." &"
	else
		echo "Comment symbol not declared"
	endif
endfunction
noremap <silent> <F7> :call Comment()<CR>

function! Uncomment()
	if exists("b:comment")
		if exists("b:comment2")
			execute "silent! s/^\\(\\s*\\)\\(".b:comment2."\\|".b:comment."\\)\\s*/\\1"
		else
			execute "silent! s/^\\(\\s*\\)".b:comment."\\s*/\\1"
		endif
	else
		echo "Comment symbol not declared"
	endif
endfunction
noremap <silent> <F8> :call Uncomment()<CR>

function! Spell()
	inoremap a Asia 
	inoremap b Bangalore 
	inoremap c China 
	inoremap d Delhi 
	inoremap e England 
	inoremap f Finland 
	inoremap g Germany 
	inoremap h Hollow 
	inoremap i India 
	inoremap j John 
	inoremap k Kite 
	inoremap l Liquid 
	inoremap m Malaysia 
	inoremap n Norway 
	inoremap o Ostrich 
	inoremap p Parrot 
	inoremap q Quarter 
	inoremap r Rome 
	inoremap s Science 
	inoremap t Table 
	inoremap u Ugly 
	inoremap v Virus 
	inoremap w Wolf 
	inoremap x Xerox 
	inoremap y Yugoslavia 
	inoremap z Zimbabwe 
	inoremap A ASIA 
	inoremap B BERLIN 
	inoremap C CHINA 
	inoremap D DENMARK 
	inoremap E ENGLAND 
	inoremap F FINLAND 
	inoremap G GERMANY 
	inoremap H HOLLOW 
	inoremap I INDIA 
	inoremap J JOHN 
	inoremap K KITE 
	inoremap L LEBANON 
	inoremap M MEXICO 
	inoremap N NAPKIN 
	inoremap O OSLO 
	inoremap P POLAND 
	inoremap Q QUATAR 
	inoremap R ROCKET 
	inoremap S SCIENCE 
	inoremap T TABLE 
	inoremap U UGLY 
	inoremap V VIRUS 
	inoremap W WOLF 
	inoremap X XEROX 
	inoremap Y YUGOSLAVIA 
	inoremap Z ZIMBABWE 
    inoremap <BS> <Esc>dbi
endfunction
noremap <silent> <F2> :call Spell()<CR>

function! UnSpell()
	iunmap a
	iunmap b
	iunmap c
	iunmap d
	iunmap e
	iunmap f
	iunmap g
	iunmap h
	iunmap i
	iunmap j
	iunmap k
	iunmap l
	iunmap m
	iunmap n
	iunmap o
	iunmap p
	iunmap q
	iunmap r
	iunmap s
	iunmap t
	iunmap u
	iunmap v
	iunmap w
	iunmap x
	iunmap y
	iunmap z
	iunmap A
	iunmap B
	iunmap C
	iunmap D
	iunmap E
	iunmap F
	iunmap G
	iunmap H
	iunmap I
	iunmap J
	iunmap K
	iunmap L
	iunmap M
	iunmap N
	iunmap O
	iunmap P
	iunmap Q
	iunmap R
	iunmap S
	iunmap T
	iunmap U
	iunmap V
	iunmap W
	iunmap X
	iunmap Y
	iunmap Z
    iunmap <BS>
endfunction
noremap <silent> <F3> :call UnSpell()<CR>

" Map & to grep the word under the cursor in the current folder and all its
" subdirectories. Make sure you are in the right parent folder first!
" First attempt uses the l register to copy the word, and then pastes from it
" in command mode
" noremap <silent> & viw"ly:!grep -nrI '<C-r>l' .<CR>
" Second attempt uses vim's <cword>
noremap & :below term bash -c "grep -nrI '\\<<cword>\\>' ."<CR>

" CtrlP setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Map for undotree
nnoremap <F5> :UndotreeToggle<CR>

" Vimspector mappings
let g:vimspector_base_dir='/home/virinchi/.vim/pack/vimspector/opt/vimspector'
packadd! vimspector
nnoremap <silent> <Space>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <Space>dB :call vimspector#ToggleAdvancedBreakpoint()<CR>
nnoremap <silent> <Space>do :call vimspector#StepOver()<CR>
nnoremap <silent> <Space>di :call vimspector#StepInto()<CR>
nnoremap <silent> <Space>dO :call vimspector#StepOut()<CR>
nnoremap <silent> <Space>dC :call vimspector#RunToCursor()<CR>
nnoremap <silent> <Space>dc :call vimspector#Continue()<CR>
nnoremap <silent> <Space>dl :call vimspector#Launch()<CR>
nnoremap <silent> <Space>dj :call vimspector#JumpToProgramCounter()<CR>
nnoremap <silent> <Space>dw :exec ":VimspectorWatch ".input("Enter watch expression:")<CR>
nnoremap <silent> <Space>d<Up> :call vimspector#UpFrame()<CR>
nnoremap <silent> <Space>d<Down> :call vimspector#DownFrame()<CR>
nnoremap <silent> <Space>de :call vimspector#DownFrame()<CR>
nnoremap <silent> <Space>dT :call vimspector#Stop()<CR>

set visualbell
" set t_vb=\|100f
