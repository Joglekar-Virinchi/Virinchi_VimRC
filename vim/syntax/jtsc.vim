" JTSC syntax file
" Language:             Janglee-Toofan scripts

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Use case sensitive matching of keywords
syn case match

" Syntax group definitions
syn keyword jtsc_item     jt piclin picrot arms gphoto2
syn match jtsc_item  "\<arm\[0\]"
syn match jtsc_item  "\<arm\[1\]"
syn match jtsc_item  "\<arm\[2\]"
syn match jtsc_item  "\<arm\[3\]"
syn match jtsc_item  "\<arm\[4\]"
syn match jtsc_item  "\<arm\[5\]"
syn match jtsc_item  "\<arm\[6\]"
syn match jtsc_item  "\<arm\[7\]"
syn match jtsc_item  "\<arm\[8\]"
syn match jtsc_item  "\<arm\[9\]"
syn match jtsc_item  "\<arm\[10\]"
syn match jtsc_item  "\<arm\[11\]"


syn keyword jtsc_action   get set
syn match jtsc_action     "--capture-image-and-download"

syn keyword jtsc_param    direction move movepulses moveall pwmcount pwmtcount
syn keyword jtsc_param    pulsecount thresh isbusy getadc load refload switch home
syn keyword jtsc_param    prepload fakeprepload autoload autounload calibrate cw
syn keyword jtsc_param    acw up down calibrateadc release calfile broadcast mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Standard numbers
syn match jtsc_Number  "\<\d\+\>"

" Comments, order of matches is important here
syn keyword jtsc_FIXME contained  FIXME TODO
syn match  jtsc_Comment  "#.*$"  contains=octaveFIXME,octaveTab,@Spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apply highlight groups to syntax groups defined above

" Define the default highlighting.
if version >= 508 || !exists("did_jtsc_syntax_inits")
  if version < 508
    let did_jtsc_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jtsc_item	                Conditional
  HiLink jtsc_action	                PreProc
  HiLink jtsc_param	                Function
  HiLink jtsc_FIXME                     Todo
  HiLink jtsc_Number                    Number
  HiLink jtsc_Comment                   Comment
  delcommand HiLink
endif

let b:current_syntax = "jtsc"
