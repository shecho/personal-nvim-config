" onedark.vim override: Don't set a background color when running in a terminal;
" if (has("autocmd") && !has("gui_running"))
"   augroup colorset
"     autocmd!
"     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"     autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"   augroup END
" endif


hi Comment cterm=italic
" let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:one_termcolors=256
let g:one_allow_italics = 1 

syntax on
" colorscheme onedark
colorscheme one
call one#highlight('Boolean', '', '', 'bolditalic')
call one#highlight('Conditional', '', '', 'bolditalic')
call one#highlight('Type', '', '', 'bolditalic') 
call one#highlight('Keyword', 'c678dd', '', 'bolditalic')"reserved words
call one#highlight('Include', 'c678dd', '', 'bolditalic')"imports/exports
call one#highlight('Number', '', '', 'bold')
call one#highlight('Operator', 'c678dd', '', '')"not use italic to evoid the ligatures lost
call one#highlight('Identifier', '', '', 'bold')"params abd arguments
call one#highlight('String', '', '', 'bold')"params abd arguments

" call one#highlight('Function', '', '', 'italic')
" call one#highlight('Delimiter','d19a66', '000000', 'italic')"brackets
" call one#highlight('Define', '', '000000', 'italic')
" call one#highlight('SpecialChar', '000000', '000000', 'italic')
" call one#highlight('Special', '000000', '', 'italic')
" call one#highlight('Statement', 'B243E6', '000000', 'italic')
" call one#highlight('PreCondit', 'B243E6', '000000','italic')"not working 
" call one#highlight('Structure', 'B243E6', '000000', 'italic')"not working 
" call one#highlight('Typedef', 'B243E6', '000000', 'italic')"not working 
" call one#highlight('Keyword', 'd19a66', '000000', 'italic')
" call one#highlight('Constant', '', '', 'italic')
" call one#highlight('Character', '', '000000', 'italic')
" call one#highlight('htmlTagName', '', '000000', 'italic')
" call one#highlight('htmlTag', '', '000000', 'italic')
" 
" checks if your terminal has 24-bit color support
" --------------------------------------------------------------
" colorscheme onedark
" autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting
" autocmd ColorScheme * call onedark#set_highlight("Type", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting
" call onedark#highlight('Boolean', '', '', 'bolditalic')
" call onedark#highlight('Conditional', '', '', 'bolditalic')
" call onedark#highlight('Type', '', '', 'bolditalic') 
" call onedark#highlight('Keyword', 'c678dd', '', 'bolditalic')"reserved words
" call onedark#highlight('Include', 'c678dd', '', 'bolditalic')"imports/exports
" call onedark#highlight('Number', '', '', 'bold')

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
