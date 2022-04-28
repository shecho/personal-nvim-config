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
call one#highlight('Number', '', '', 'bold')
call one#highlight('String', '', '', 'bold')"string
call one#highlight('Function', '', '','bold')" #B243E6
call one#highlight('Conditional', '', '', 'italic')
call one#highlight('Type', '', '', 'bolditalic') 
call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
call one#highlight('Include', 'c678dd', '', 'italic')"imports/exports
call one#highlight('Asynchronous', '', '', 'italic')
call one#highlight('Operator', 'c678dd', '', '')"not use italic to evoid the ligatures lost *= - + =>'#c678dd#


call one#highlight('CursorColumn', '828997', '', 'bolditalic')"current word #4b5263 #5c6370 #828997 #abb2bf

call one#highlight('Error', 'be5046', '', 'bolditalic')"#e06c75 #be5046 #c18401 #e5c07b #d19a66
call one#highlight('ErrorMsg', 'e06c75', '', 'bold')

call one#highlight('Exception', '', '', 'italic') " try catch
call one#highlight('StorageClass', '', '','bolditalic')" #B243E6

call one#highlight('CocErrorSign', 'e06c75', '', 'bolditalic')
call one#highlight('CocWarningSign', 'd19a66', '', 'bolditalic')

call one#highlight('Identifier', '', '', 'bold')"params abd arguments and variables names
" call one#highlight('SpecialChar', '', '', 'standout')
" call one#highlight('Special', '', '', 'bolditalic')

call one#highlight('Delimiter','', '', 'bold')"brackets
call one#highlight('MatchParen', '', '', 'inverse')

" call one#highlight('Label', '', '000000', 'italic')html and jsx 
" call one#highlight('Search', '', '', 'standout')
" call one#highlight('WildMenu', '', '', 'reverse')
" call one#highlight('Directory', '', '', 'bold')
" call one#highlight('CursorLine', '000000', '000000', '')

" call one#highlight('Use', '', '', 'standout')
" call one#highlight('Utility', '', '', 'standout')
" call one#highlight('Select', '', '', 'standout')
call one#highlight('Visual', '', '', 'bolditalic')
" call one#highlight('IncSearch', '', '', 'standout')
" call one#highlight('Label', '', '', '')"HTML tags and JSX
" call one#highlight('CursorLine', '', '', 'bolditalic')" current line
" call one#highlight('Statement', '', '', 'bold')
" call one#highlight('Define', '', '000000', 'bolditalic')
" 

		" bold
		" underline
		" undercurl	curly underline
		" strikethrough
		" reverse
		" inverse		same as reverse
		" italic
		" standout
		" nocombine	override attributes instead of combining them
		" NONE		no attributes used (used to reset it)


" checks if your terminal has 24-bit color support
" --------------------------------------------------------------
" colorscheme onedark
" autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting
" autocmd ColorScheme * call onedark#set_highlight("Type", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
