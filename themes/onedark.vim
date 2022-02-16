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
call one#highlight('Operator', 'c678dd', '', '')"not use italic to evoid the ligatures lost '#c678dd#
call one#highlight('Identifier', '', '', 'bold')"params abd arguments
call one#highlight('String', '', '', 'bold')"string
call one#highlight('CursorColumn', '828997', '', 'bolditalic')"current word #4b5263 #5c6370 #828997 #abb2bf
call one#highlight('Error', 'be5046', '', 'bolditalic')"#e06c75 #be5046 #c18401 #e5c07b #d19a66
call one#highlight('ErrorMsg', 'e06c75', '', 'bold')
call one#highlight('Exception', '', '', 'italic')
call one#highlight('StorageClass', '', '','bolditalic')" #B243E6
call one#highlight('Directory', '', '', 'bold')
call one#highlight('CocErrorSign', 'e06c75', '', 'bolditalic')
call one#highlight('CocWarningSign', 'd19a66', '', 'bolditalic')
" call one#highlight('Function', '', '','bolditalic')" #B243E6
" call one#highlight('javascriptFuncArg', '000000', '000000','bolditalic')" #B243E6
" call one#highlight('typescriptBraces', '000000', '000000', 'italic')"not working 
" call one#highlight('Label', '', '', '')"HTML tags and JSX
" call one#highlight('CursorLine', '', '', 'bolditalic')" current line
" call one#highlight('Delimiter','', '', 'bold')"brackets
" call one#highlight('Statement', '', '', 'bold')
" call one#highlight('Keyword', '', '', 'bold')
" call one#highlight('Define', '', '000000', 'bold')
" call one#highlight('SpecialChar', '000000', '000000', 'italic')
" call one#highlight('Character', '', '000000', 'italic')
" call one#highlight('Structure', 'B243E6', '000000', 'italic')"not working 
" call one#highlight('Constant', '', '', 'italic')
" call one#highlight('Constant', '', '', 'italic')
" call one#highlight('Constant', '', '', 'italic')
" 
" checks if your terminal has 24-bit color support
" --------------------------------------------------------------
" colorscheme onedark
" autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting
" autocmd ColorScheme * call onedark#set_highlight("Type", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
